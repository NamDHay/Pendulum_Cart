KROOT ?= /lib/modules/`uname -r`/build
DTS ?= dts/cart.dts

obj-m += src/main.o

all: module dt
	echo Build Device Tree Overlay and Kernel Modules for Pendulum on a Cart
module:
	@make -C $(KROOT) M=$(PWD) modules
dt:
	@dtc -@ -I dts -O dtb -o $(basename $(DTS)).dtbo $(DTS)
clean:
	@make -C $(KROOT) M=$(PWD) clean
