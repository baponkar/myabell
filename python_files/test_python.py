from tkinter import *


window=Tk()
window.title(" My Converter")


b1=Button(window,text="Length")
b1.grid(row=1,column=2)

b2=Button(window,text="Mass")
b2.grid(row=2,column=2)

b3=Button(window,text="Time")
b3.grid(row=3,column=2)

b4=Button(window,text="Volume")
b4.grid(row=1,column=3)

b5=Button(window,text="Area")
b5.grid(row=2,column=3)

b6=Button(window,text="Temperature")
b6.grid(row=3,column=3)


b7=Button(window,text="Mathematical")
b7.grid(row=1,column=4)

b8=Button(window,text="Volume")
b8.grid(row=2,column=4)


label1=Label(window,text="Select your conversion type")
label1.grid(row=0,column=0)


window.mainloop()
