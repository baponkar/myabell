# use ffmplay to play the videos with tkinter
 
import tkinter as tk
import tkinter.ttk as ttk
import os
 
root = tk.Tk()
 
lb = tk.Listbox(root)
lb.pack()
 
 
def ffplay(event):
    if lb.curselection():
        file = lb.curselection()[0]
        os.startfile(lb.get(file))
 
 
for file in os.listdir():
    if file.endswith(".mp4"):
        lb.insert(0, file)
 
bstart = ttk.Button(root, text="Start movie")
bstart.pack()
 
bstart.bind("<ButtonPress-1>", ffplay)
root.mainloop()
