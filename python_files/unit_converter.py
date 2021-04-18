#Different unit conversion
#Last Update : 26/07/2020
#Author : Bapon Kar
#Description :

from tkinter import *


window=Tk()
window.title(" My Converter")

def convert():
	print (e1_value.get())
	kg=float(e1_value.get())
	g=kg*1000
	lb=kg*2.20462
	oun=kg*35.274

	t1.delete("1.0",END)
	t1.insert(END,g)
	t2.delete("1.0",END)
	t2.insert(END,lb)
	t3.delete("1.0",END)
	t3.insert(END,oun)



b1=Button(window,text="Convert",command = convert)
b1.grid(row=0,column=2)

e1_value=IntVar()
e1=Entry(window,textvariable=e1_value)
e1.grid(row=0,column=1)

e2=Label(window,text="Kg")
e2.grid(row=0,column=0)


e3=Label(window,text="Gram")
e3.grid(row=1,column=0)

e4=Label(window,text="Pound")
e4.grid(row=1,column=1)

e5=Label(window,text="Ounce")
e5.grid(row=1,column=2)


t1=Text(window,height=1,width=20)
t1.grid(row=3,column=0)

t2=Text(window,height=1,width=20)
t2.grid(row=3,column=1)

t3=Text(window,height=1,width=20)
t3.grid(row=3,column=2)


window.mainloop()
