## ReVanced Dynamic Mount

Template for Dynamic Mounting on ReVanced Modified Apps.

### Background

- Dynamically mount the ReVanced APK and make bind mounts only visible for the patched app to avoid detection. Other apps will only see the original `base.apk` of the patched app.

### Steps

- Install the [Process Monitor Tool](https://github.com/HuskyDG/magic_proc_monitor) module with version 2.1+.
- Clone/Download this repo as zip.
- Replace [revanced.apk](revanced.apk) with the patched version of the app you want to mount.
- Modify [module.prop](module.prop) according to the app info you want to patch. For example:

```
id=ifrrevancedinject
name=Infinity For Reddit ReVanced
package=ml.docilealligator.infinityforreddit
version=7.0.0
```

- Make sure you have installed the unpatched version of the app.
- Zip this repository and then flash it on APatch/KSU/Magisk Manager.
- If you are using KSU, please make sure that the "Umount modules" option is DISABLED for your patched apps in KSU Manager.
- Enjoy no suspicious mounts being detected.

### Credits

- [HuskyDG](https://github.com/HuskyDG/) - For the original project.
