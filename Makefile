all: clean release

check:
ifndef VERSION
	@echo "Define VERSION in ENV"
	@exit 1;
else
	@echo "Build version ${VERSION}"
endif

prepare: check
	@mkdir -p tmp
	curl -sL "https://github.com/weaveworks/flux/releases/download/${VERSION}/fluxctl_linux_amd64" > tmp/fluxctl_amd64

release: prepare
	set -e; \
	SHA256_AMD64=`sha256sum tmp/fluxctl_amd64 | awk '{print $$1}'`; \
	sed -i.bak -r -e "s/pkgver=.*/pkgver=$${VERSION}/g" \
        -e "s/sha256sums_x86_64=.*/sha256sums_x86_64=('$${SHA256_AMD64}')/g" PKGBUILD; \
	makepkg --printsrcinfo > .SRCINFO; \
	makepkg; \
	sudo pacman -U fluxctl-bin*;

clean:
	rm -rf fluxctl-* pkg src *.bak tmp

.PHONY: all check prepare release clean
