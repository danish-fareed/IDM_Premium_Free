import winreg

def delete_registry_key():
    try:
        key_path = r"S-1-5-21-4065606622-1068658174-443507042-1002_Classes\WOW6432Node\CLSID"
        sub_key = "{07999AC3-058B-40BF-984F-69EB1E554CA7}"
        reg_path = f"{key_path}\\{sub_key}"

        with winreg.OpenKey(winreg.HKEY_USERS, key_path, 0, winreg.KEY_ALL_ACCESS) as key:
            winreg.DeleteKey(key, sub_key)
        
        print(f"Successfully deleted registry key: {reg_path}")
    except FileNotFoundError:
        print(f"Registry key not found: {reg_path}")
    except PermissionError:
        print("Permission denied. Please run as an administrator.")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    delete_registry_key()
