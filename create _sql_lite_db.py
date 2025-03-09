import sqlite3
import tkinter as tk
from tkinter import filedialog, messagebox
from tkinter import ttk


class Application:
    def __init__(self, root):
        # ustawienia tkinter
        self.root = root
        self.root.title("SQL to DB Converter")
        self.root.geometry("400x250")
        # self.root.resizable(False, False)  

        # style tkk
        self.style = ttk.Style()
        self.style.configure("TButton", font=("Arial", 12), padding=5)
        self.style.configure("TLabel", font=("Arial", 11), padding=5)

        # tworzenie obiektów
        self.file_path = None
        self.create_widgets()

    def create_widgets(self):
        frame = ttk.Frame(self.root, padding=20)
        frame.pack(expand=True)


        ttk.Label(frame, text="Loaded File: ", font=("Arial", 12, "bold")).pack(anchor="w")

        self.textlabel = ttk.Label(frame, text="", foreground="blue")
        self.textlabel.pack(anchor="w", pady=(0,10))
        ttk.Button(frame, text="Import SQL file", command=self.open_file).pack(fill="x", pady=5)
        ttk.Button(frame, text="Change to db", command=self.convert_data).pack(fill="x", pady=5)
        ttk.Button(frame, text="Exit", command=self.root.quit).pack(fill="x", pady=5)

        
    def open_file(self):
        file_path = filedialog.askopenfilename(
            filetypes=[("SQL Files", "*.sql")],
        ) 
        if file_path:
            self.file_path = file_path
            self.textlabel.config(text=file_path)
            messagebox.showinfo("File selected", f"Selected file\n{file_path}")
        else:
            messagebox.showinfo("File not imported", "No file selected")

    def convert_data(self):
        if not self.file_path:
           messagebox.showwarning("No file", "Please import an SQL file first.")
           return
       
        db_path = filedialog.asksaveasfilename(defaultextension=".db", filetypes=[("Database Files", "*.db")], title="Save Database as")
    #    
    # db_path = self.file_path.replace(".sql", ".db")

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
    root = tk.Tk()
    app = Application(root)
    root.mainloop()