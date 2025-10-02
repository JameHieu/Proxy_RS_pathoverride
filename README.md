# 🔄 Change Proxy Redshift Path code



📥 **Download Here**

[![Proxy_RS_pathoverride](https://img.shields.io/badge/Download_Here-Proxy_RS_pathoverride-blueviolet)](https://github.com/JameHieu/Proxy_RS_pathoverride/blob/main/Proxy_RS_pathoverride.bat)

</aside>  

---

## ℹ️ About This Script

This batch file is **only a helper tool** to quickly create, update, or reset the `REDSHIFT_PATHOVERRIDE_FILE` environment variable.  
It does **not** change Redshift’s core behavior — it simply automates setting the override file path for convenience.  

The concept of `REDSHIFT_PATHOVERRIDE_FILE` is explained in Maxon’s official documentation:  
👉 [Redshift Environment Variables – Maxon Help](https://help.maxon.net/r3d/maya/en-us/Content/html/Redshift+Environment+Variables.html)

This script was inspired by that documentation to make everyday workflow faster and easier.

---

# 📖 User Guide for `Redshift Path Override Setup.bat`

## 🎯 Purpose

This batch file is created to **manage the environment variable `REDSHIFT_PATHOVERRIDE_FILE`** on Windows, helping Redshift read the `redshift_path_override.txt` file in order to change Proxy paths.

You can:

1. Update the environment variable to point to the current override file
2. Create a new override file (mapping `Old Path → New Path`)
3. Reset and completely remove this environment variable from the system

---

## 🖥 How to Run

* Double-click the `.bat` file or run it via **Command Prompt**
* When opened, the CMD screen will show these functions:

```bash
[1] Update environment variable to point to the current override file
[2] Create a new override file
[3] Reset (completely remove REDSHIFT_PATHOVERRIDE_FILE from Windows)
```

👉 Enter `1`, `2`, or `3` then press **Enter**.

---

## 🔧 Detailed Functions

### 1️⃣ Update environment variable

* Select **[1]**
* The script will check if there is a `redshift_path_override.txt` file in the current folder.
* If yes → it will assign:

```bash
REDSHIFT_PATHOVERRIDE_FILE = path\to\redshift_path_override.txt
```

* Variable will be set for both **current session** and **Windows Registry**
* If not found → it will return an error.

➡ Use this when you already have an override file and just want Redshift to read it again.

---

### 2️⃣ Create a new override file

* Select **[2]**
* The script will delete the old override file (if any).
* Then, you enter step by step:

```bash
Enter Old Proxy Path (type "Done" to finish):
```

* Input the **old Proxy path** → Enter
* Input the **new Proxy path** → Enter

**Example:**

```bash
Old: D:\Assets\Proxy\House\
New: E:\Server\Proxy\House\
```

* Each `OLD_PATH → NEW_PATH` pair will be saved into `redshift_path_override.txt`
* When finished, type **Done**
* The script sets the environment variable `REDSHIFT_PATHOVERRIDE_FILE` pointing to this file

⚠️ **Do not delete this `.txt` file** — Redshift reads directly from it.

---

### 3️⃣ Reset (remove environment variable)

* Select **[3]**

* The script deletes `REDSHIFT_PATHOVERRIDE_FILE` from:

  * Current CMD session
  * Windows Registry

* If still visible in the Environment Variables list → **log out or restart CMD** to refresh.

➡ Use this when you want to remove the override completely.

---

## 🔍 How to Find Old Proxy Paths

If you don’t know the **Old Path** of a Proxy/Texture:

1. Right-click your `.rs` file → **Open with Notepad**
2. Look for texture paths inside, for example:

```
/D/Assets/Proxy/Building/wall_diffuse.tx
/E/Server/Textures/House/floor_normal.tx
```

3. Copy these as the **Old Path** and set your desired **New Path** in the override file.

✅ This is especially useful in **multi-machine studios**, where different artists may have different local paths.

---

## ✅ Usage Tips

* After changing the override file → **restart Houdini, Maya, C4D, etc.** so Redshift loads the new path.
* Recommended: place the `.bat` file in the same folder as `redshift_path_override.txt`.
* For multi-machine studios → copy the `.bat` and `.txt` file across machines for syncing.
---
