# Android device tree for Lenovo Tab M10 HD (TB-X505X) with mainline kernel

## Kernel repository

|               Path               |                    URL                    |         Branch         |
|----------------------------------|-------------------------------------------|------------------------|
| kernel/mainline/msm89x7-mainline | https://github.com/msm89x7-mainline/linux | msm89x7/7.1.3          |

## Kernel edits

Apply the following patches (and squash it) in your kernel repository if you are targeting LineageOS 22+:

| Subject | Description | Link |
|---|---|---|
| `ANDROID: binder: Add thread and process freeze accounting` | Fixes freezing of cached apps | https://android.googlesource.com/kernel/common-patches/+/refs/heads/main-kernel/android-mainline/ANDROID-binder-Add-thread-and-process-freeze-accounting.patch |
| `ANDROID: usb: gadget: configfs: Add Uevent to notify userspace` | Fixes USB in normal mode | https://android.googlesource.com/kernel/common-patches/+/refs/heads/main-kernel/android-mainline/ANDROID-usb-gadget-configfs-Add-Uevent-to-notify-userspace.patch |
| `ANDROID: mm/memfd-ashmem-shim: Introduce shim layer` | Fixes media codec | https://android.googlesource.com/kernel/common-patches/+/refs/heads/main-kernel/android-mainline/ANDROID-mm-memfd-ashmem-shim-Introduce-shim-layer.patch |
| `ANDROID: mm: shmem: Use memfd-ashmem-shim ioctl handler"` | Fixes media codec | https://android.googlesource.com/kernel/common-patches/+/refs/heads/main-kernel/android-mainline/ANDROID-mm-shmem-Use-memfd-ashmem-shim-ioctl-handler.patch |
