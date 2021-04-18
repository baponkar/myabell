#!/usr/bin/python3

"""
Build Date : 18/01/2019.
Last Modification : 18/01/2019.
Author : Bapon Kar.
Name   : My Dictionary
Version : 1.0.0
Description : This is a english to english Dictionary
              You can find the meaning and description of all english word by this app.
              Thank You for Downloading This application.
_______________________________________________________________________________________.
"""


import playsound
import json
from difflib import *
import os
import getpass
import os

username= getpass.getuser()

image_path=os.path.abspath("/home/" + username + "/Myabell-1.0.0/Icons/moon.png")
icon_path = os.path.abspath("/home/" + username + "/Myabell-1.0.0/Icons/Myabell_logo64.png")


data_file_path=os.path.abspath("/home/" + username +"/Myabell-1.0.0/txt/data.json")
data = json.load(open(data_file_path,"r"))
logo_path = os.path.abspath("/home/" + username + "/Myabell-1.0.0/Icons/Myabell_logo64.png")


def center(win):
    """
    centers a tkinter window
    :param win: the root or Toplevel window to center
    """
    win.update_idletasks()
    width = win.winfo_width()
    frm_width = win.winfo_rootx() - win.winfo_x()
    win_width = width + 2 * frm_width
    height = win.winfo_height()
    titlebar_height = win.winfo_rooty() - win.winfo_y()
    win_height = height + titlebar_height + frm_width
    x = win.winfo_screenwidth() // 2 - win_width // 2
    y = win.winfo_screenheight() // 2 - win_height // 2
    win.geometry('{}x{}+{}+{}'.format(width, height, x, y))
    win.deiconify()


def view(word,word_dict):
	res = []
	if word in word_dict:
		for i in word_dict[word]:
			if int(len(str(i))) > 150:
				res.append(str(i[1:100]))
				res.append(str(i[100:]))
				#print(res)
			else:
				res.append(i)
	elif word.lower() in word_dict:
		word=word.lower()
		for i in word_dict[word]:
			res.append(i)
	elif close_matcher(word,word_dict) != "":
		res.append("\tAre You looking for? : " + close_matcher(word,word_dict))

	else:
		res.append("\tSorry no such type word exist!")
	return res

def close_matcher(word,word_dict):
	#playsound.playsound('mouse_click.mp3')
	res = get_close_matches(word,word_dict)[0]
	return res



def search_command():
	#playsound.playsound('mouse_click.mp3')
	search_word=search_text.get()
	if search_word == '':
		lsb1.delete(0,END)
		lsb1.insert(END,"\n\n\t\tSorry You Did not entered anything!")
	list_view = view(search_word,data)
	lsb1.delete(0,END)
	for i in view(search_word,data):
		lsb1.insert(END,i)

	return list_view


def about_command():
	#playsound.playsound('mouse_click.mp3')
	lsb1.delete(0,END)
	for i in __doc__.split('\n',10):
		lsb1.insert(END,i)


from tkinter import *
root = Tk()
root.geometry("600x500")
icon=PhotoImage(file = logo_path)
root.iconphoto(False, icon)

background_image = PhotoImage(file = image_path)
background_label = Label(image=background_image)
background_label.place(x=0, y=0,relwidth=1,relheight=1)
background_label.photo = background_image

root.title("My Dictionary")
root.configure(background="#C3D3C3")

background_image = PhotoImage(file = logo_path)
background_label = Label( image=background_image)
background_label.place(x=0, y=0,relwidth=1,relheight=1)
background_label.photo = background_image

menubar = Menu(root)

filemenu = Menu(menubar, tearoff=0)
filemenu.add_command(label="New")
filemenu.add_command(label="Open")
filemenu.add_command(label="Save")
filemenu.add_separator()
filemenu.add_command(label="Exit", command=root.quit)
#menubar.add_cascade(label="File", menu=filemenu)

#helpmenu = Menu(menubar, tearoff=0)
#helpmenu.add_command(label="Help Index")
#helpmenu.add_command(label="About...",command=about_command)
#menubar.add_cascade(label="Help", menu=helpmenu)

root.config(menu=menubar)







l1 = Label(root,text="            My Dictionary ",fg='orange',fon=("URW Chancery L", 20))
l1.grid(row=0,column=1)

l2 = Label(root,text=" Enter Your word ",fg='blue',font=("URW Chancery L", 20))
l2.grid(row=2,column =0)

b1 = Button(root,text="Search",width=8,command=search_command,bg='powderblue',fg='red',font=("URW Chancery L", 16))
b1.grid(row=2,column=3)


search_text = StringVar()
e1 = Entry(root,textvariable=search_text,width=35,bg='powderblue',fg='brown',font=("URW Chancery L", 20))
e1.grid(row=2,column=1,columnspan=2)


lsb1 = Listbox(root,height=30,width=80,bg='#9D6473',fg='white',font=("URW Chancery L", 22))
lsb1.grid(row=3,column=0,rowspan=7,columnspan=5)

root.configure(background="#C3D3C3")
root.title("My English To Bengali Dictionary")


center(root)
root.geometry("900x700")
root.resizable(False, False)
root.mainloop()

