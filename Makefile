# Basic Linux
#
# ./Makefile
# Compiles all programs and, if wished, creates a live cd image.

# After cloning this repo, run make download-dependencies first!

linux_kernel_folder = linux
linux_kernel_config = configs/linux
linux_kernel_initramfs_folder = initramfs


# To use a different kernel version, change this link to a compressed tarball
linux_kernel_download_link = https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.6.4.tar.xz

.PHONY: boot cd init download-dependencies cleanup-dependencies

download-dependencies: $(linux_kernel_folder)



download-linux $(linux_kernel_folder):
	@make cleanup-dependencies
	mkdir $(linux_kernel_folder)
	wget -O linux.tar.xz $(linux_kernel_download_link)
	tar xf linux.tar.xz --directory=$(linux_kernel_folder)
	rm linux.tar.xz # Cleanup

cleanup-dependencies:
	rm -rf $(linux_kernel_folder) 2> /dev/null; true