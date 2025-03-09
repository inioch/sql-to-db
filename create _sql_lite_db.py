import sqlite3
import tkinter as tk
from tkinter import filedialog, messagebox
from tkinter import ttk
import customtkinter as ctk


class Application:
    def __init__(self, root):
        # ustawienia tkinter
        self.root = root
        self.root.title("SQL to DB Converter")
        self.root.geometry("450x250")
        self.root.resizable(False, False)  
    

        ctk.set_appearance_mode("system")
        ctk.set_default_color_theme("blue")  

        self.create_widgets()      

    def create_widgets(self):
        ctk.CTkLabel(root, text="Loaded File: ", font=("Arial", 12, "bold")).pack(anchor="w")

        self.textlabel = ctk.CTkLabel(root, text="", text_color="blue")
        self.textlabel.pack(anchor="w", pady=(0,10))
        ctk.CTkButton(root, text="Import SQL file", command=self.open_file).pack(fill="x", pady=5)
        ctk.CTkButton(root, text="Change to db", command=self.convert_data).pack(fill="x", pady=5)
        ctk.CTkButton(root, text="Exit", command=self.root.quit).pack(fill="x", pady=5)

        
    def open_file(self):
        file_path = filedialog.askopenfilename(
            filetypes=[("SQL Files", "*.sql")],
        ) 
        if file_path:
            self.file_path = file_path
            self.textlabel.configure(text=file_path)
        else:
            messagebox.showinfo("File not imported", "No file selected")

    def convert_data(self):
        if not self.file_path:
           messagebox.showwarning("No file", "Please import an SQL file first.")
           return
       
        db_path = filedialog.asksaveasfilename(defaultextension=".db", filetypes=[("Database Files", "*.db")], title="Save Database as")
        if not db_path:
           messagebox.showwarning("Canceled", "Type name to save the database")
           return
        try:
           conn = sqlite3.connect(db_path)
           cursor = conn.cursor()
           with open(self.file_path, "r", encoding="utf-8") as sql_file:
               sql_script = sql_file.read()
           
           cursor.executescript(sql_script)
           conn.commit()
           conn.close()

           messagebox.showinfo("Success", "SQL script converted successfully.")
        except Exception as e:
           messagebox.showerror("Error", f"An error occurred: {e}")

if __name__ == "__main__":
    root = ctk.CTk()
    app = Application(root)
    root.mainloop()