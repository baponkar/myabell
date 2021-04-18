#!/usr/bin/python3

"""
Build Date : 20/08/2020.
Last Modification : 09/08/2020.
Author : Bapon Kar.
Name   : English To Bengali Dictionary
Version : 1.0.0
Description : This is a english to bengali Dictionary
              You can find the meaning and description of all english word by this app.
              Thank You for Downloading This application.
_______________________________________________________________________________________.
"""



from tkinter import *

from PIL import ImageTk, Image
import os
import getpass
from difflib import *
import requests

username= getpass.getuser()

back_image_path=os.path.abspath("/home/" + username + "/Myabell-1.0.0/Icons/mirlo-ciclo-de-andar.gif")
icon_path = os.path.abspath("/home/" + username + "/Myabell-1.0.0/Icons/Myabell_logo64.png") 
data_path = "/home/" + username + "/Myabell-1.0.0/txt/data"

root = Tk()


background_image = PhotoImage(file = back_image_path)
background_label = Label(image=background_image)
background_label.place(x=0, y=0,relwidth=1,relheight=1)
background_label.photo = background_image

label = Label(root,text="Type Here",fg="red",bg='#40B49B')
label.place(x=370,y=40)

entry = Entry(root,bg="powderblue",bd="2",fg="blue")
entry.place(x=445,y=40)

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

def find_files(filename, search_path):
	result = []
	
	for root, dir, files in os.walk(search_path):
		if filename in files:
			result.append(os.path.join(root, filename))
		return result
		


def cmd():
	text = entry.get().lower()
	img_file = find_files(text,data_path)
	if img_file == []:
		print("Not Valid entry")
		lsb1.delete(0,END)
		lsb1.insert(END,'\n' +"No data in Local Machine." + "\nPlease try other two option.")
	else:
		img = ImageTk.PhotoImage(Image.open(str(img_file[0])))
		panel = Label(root, image = img)
		panel.configure(image = img)
		panel.image = img
		panel.place(x=2, y=5)
	#panel.pack(side = "bottom", fill = "both", expand = "no")
	
def wikisearch():
	import requests
	
	S = requests.Session()
	text = entry.get()
	URL = "https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&exintro=&explaintext=&titles=" + str(text)	
	#print(URL)
	R = S.get(url=URL, params="")
	DATA = R.json()
	result1 = str(list(list( DATA['query']['pages'].items())[0])[1]['extract'])
	result1 = result1.split(".")
	result = ""
	p =0
	lsb1.delete(0,END)
	for i in result1:
		i1 = i.split(",")
		for j in i1:
		
			lsb1.insert(END,j + '\n')
		p = p + 1
	
	print(result)
	

def googTrans():
	from googletrans import Translator
	text = entry.get()
	translator = Translator()
	result = translator.translate(text, src='en', dest = 'bn')
	lsb1.delete(0,END)
	lsb1.insert(END," " + result.text + " ")
	
button = Button(root,text="Search", command=cmd,bg='yellow',fg='blue')
button.place(x=490, y= 80)

wikiButton = Button(root,text="Wikipedia Search",command=wikisearch,bg='powderblue',fg='blue')
wikiButton.place(x=460, y=120)

googButton = Button(root,text="Google Search",command=googTrans,bg='powderblue',fg='red')
googButton.place(x=470, y=180)

icon=PhotoImage(file = icon_path)
root.iconphoto(False, icon)

lsb1 = Listbox(root,height=14,width=0,bg='powderblue',fg='blue',font=("URW Chancery L", 16))
lsb1.place(x= 339, y=240)
lsb1.config(width=0)



root.configure(background="#C3D3C3")
root.title("My English To Bengali Dictionary")


center(root)
root.geometry("800x700")
root.resizable(False, False)
root.mainloop()

