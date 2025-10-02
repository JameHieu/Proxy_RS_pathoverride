# 🔄 Change Proxy Redshift Path code



📥 **Download Here**

[![Proxy_RS_pathoverride](https://img.shields.io/badge/Download-Redshift%20Render%20Optimizer-blueviolet)](https://github.com/JameHieu/Proxy_RS_pathoverride/blob/main/Proxy_RS_pathoverride.bat)

</aside>  

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

## ✅ Usage Tips

* After changing the override file → **restart Houdini, Maya, C4D, etc.** so Redshift loads the new path.
* Recommended: place the `.bat` file in the same folder as `redshift_path_override.txt`.
* For multi-machine studios → copy the `.bat` and `.txt` file across machines for syncing.

---

👉 Gợi ý: bạn nên thêm **mục lục tự động (Table of Contents)** bằng cách dùng GitHub hỗ trợ anchor link như sau:

```markdown
- [Purpose](#-purpose)
- [How to Run](#-how-to-run)
- [Detailed Functions](#-detailed-functions)
  - [Update environment variable](#1️⃣-update-environment-variable)
  - [Create a new override file](#2️⃣-create-a-new-override-file)
  - [Reset](#3️⃣-reset-remove-environment-variable)
- [Usage Tips](#-usage-tips)
```

---
