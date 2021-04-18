from tkinter import *
#from tkinter.ttk import *
import os
import getpass

user = getpass.getuser()
image_path=os.path.abspath("/home/" + user + "/Myabell-1.0.0/Icons/moon.png")
icon_path = os.path.abspath("/home/" + user + "/Myabell-1.0.0/Icons/Myabell_logo64.png")

class MainWindow():
	def __init__(self, master):
		self.master = master
		
		background_image = PhotoImage(file = image_path)
		background_label = Label(master, image=background_image)
		background_label.place(x=0, y=0,relwidth=1,relheight=1)
		background_label.photo = background_image
		
	 	#creating a button instance
		quitButton = Button(master, text="Quit",command=self.client_exit)		
		#placing the button on my window
		quitButton.place(x=500,y=460)	
		button_length=Button(master,text="Length",command=self.command)
		button_length.place(x=50,y=50)
		button_mass=Button(master,text="Mass",command=self.command1)
		button_mass.place(x=50,y=100)
		button_time=Button(master,text="Time",command=self.command2)
		button_time.place(x=50,y=150)
		button_area=Button(master,text="Area",command=self.command3)
		button_area.place(x=50,y=200)
		button_volume=Button(master,text="Volume",command=self.command4)
		button_volume.place(x=50,y=250)
		button_number_system=Button(master,text="Number System",command=self.command5)
		button_number_system.place(x=50,y=300)
	def client_exit(self):
		exit()	

	def command(self):
		self.master.withdraw()
		toplevel = Toplevel(self.master)
		toplevel.resizable(0, 0)
		toplevel.geometry("600x500")
		app = Length(toplevel)
		
	def command1(self):
		self.master.withdraw()
		toplevel = Toplevel(self.master)
		toplevel.resizable(0, 0)
		toplevel.geometry("600x500")
		app = Mass(toplevel)
	def command2(self):
		self.master.withdraw()
		toplevel = Toplevel(self.master)
		toplevel.resizable(0, 0)
		toplevel.geometry("600x500")
		app = Time(toplevel)
		
	def command3(self):
		self.master.withdraw()
		toplevel = Toplevel(self.master)
		toplevel.resizable(0, 0)
		toplevel.geometry("600x500")
		app = Area(toplevel)
		
	def command4(self):
		self.master.withdraw()
		toplevel = Toplevel(self.master)
		toplevel.resizable(0, 0)
		toplevel.geometry("600x500")
		app = Volume(toplevel)
		
	def command5(self):
		self.master.withdraw()
		toplevel = Toplevel(self.master)
		toplevel.resizable(0, 0)
		toplevel.geometry("600x500")
		app = Number(toplevel)

class Length:
	def __init__(self, master1):
		self.master1 = master1
		
		background_image2 = PhotoImage(file = image_path)
		background_label = Label(master1, image=background_image2)
		background_label.place(x=0, y=0,relwidth=1,relheight=1)
		background_label.photo = background_image2
		
		self.quitButton = Button(master1, text = 'Quit', width = 15, command = lambda:self.quit())
		self.quitButton.place(x=60,y=460)
		self.backButton = Button(master1, text = 'Back', width = 15, command = lambda:self.back())
		self.backButton.place(x=400,y=460)
		
		
		self.l1 = Label(master1,text = "Length Converter",fg='white', bg='black')
		self.l1.place(x=200, y= 5)
		
		self.l2 = Label(master1,text = "Meter",fg='white', bg='black')
		self.l2.place(x=20, y= 40)
		
		vcmd = (master1.register(self.validate), '%d', '%i', '%P',  '%s', '%S', '%v', '%V', '%W')
		self.e2 = Entry(master1, bd =2,fg='white', bg='black',validate='key', validatecommand=vcmd)
		self.e2.place(x=100,y=40)
		self.e2.config(font=("Arial", 10))
		#self.e2.insert(END,'0')
		#m = e2.get()
		#print(m)
		
		self.l3 = Label(master1,text = "Centimeter",fg='white', bg='black')
		self.l3.place(x=20, y= 100)
		self.e3 = Entry(master1, bd =2,fg='white', bg='black',validate='key', validatecommand=vcmd)
		self.e3.place(x=100,y=100)
		self.e3.config(font=("Arial", 10))
		#self.e3.insert(END,'0')
		
		self.l4 = Label(master1,text = "Feet",fg='white', bg='black')
		self.l4.place(x=20, y= 160)
		self.e4 = Entry(master1, bd =2,fg='white', bg='black',validate='key', validatecommand=vcmd)
		self.e4.place(x=100,y=160)
		self.e4.config(font=("Arial", 10))
		#self.e4.insert(END,'0')
		
		self.convertButton = Button(master1, text = 'Convert', width = 15, command = lambda:self.ins())
		self.convertButton.place(x=225,y=400)	
		
		self.clearButton = Button(master1, text = 'Clear', width = 15, command = lambda:self.clear())
		self.clearButton.place(x=225,y=450)
		
	def validate(self, action, index, value_if_allowed, prior_value, text, validation_type, trigger_type, widget_name):
		if value_if_allowed:
			try:
				float(value_if_allowed)
				return True
			except ValueError:
				return False
			else:
				return False
		
	def ins(self):
		try:
			self.m = float( self.e2.get() )
		except:
			self.m = 0
		try:
			self.cm = float( self.e3.get() )
		except:
			self.cm = 0
		try:
			self.ft = float( self.e4.get() )
		except:
			self.ft = 0
		
		if (self.m !=0 and self.cm == 0 and self.ft ==0) or (self.m !=0 and self.cm != 0 and self.ft ==0) or (self.m != 0 and self.cm == 0 and self.ft !=0) or (self.m !=0 and self.cm != 0 and self.ft != 0):
			self.cm = float(self.m * 100)
			self.ft = float(self.m * 3.28084)
			self.e2.delete(0,'end')
			self.e3.delete(0,'end')
			self.e4.delete(0,'end')
			self.e2.insert(END,str(self.m))
			self.e3.insert(END,str(self.cm))
			self.e4.insert(END,str(self.ft))
		elif (self.m ==0 and self.cm != 0 and self.ft ==0) or (self.m ==0 and self.cm != 0 and self.ft !=0):
			self.m = float(self.cm/100)
			self.ft = float(self.m/3.28084)
			self.e2.delete(0,'end')
			self.e3.delete(0,'end')
			self.e4.delete(0,'end')
			self.e2.insert(END,str(self.m))
			self.e3.insert(END,str(self.cm))
			self.e4.insert(END,str(self.ft))
		elif self.m ==0 and self.cm == 0 and self.ft !=0:
			self.m = float(self.ft/3.28084)
			self.cm = float(self.ft*100/3.28084)
			self.e2.delete(0,'end')
			self.e3.delete(0,'end')
			self.e4.delete(0,'end')
			self.e2.insert(END,str(self.m))
			self.e3.insert(END,str(self.cm))
			self.e4.insert(END,str(self.ft))		
		elif self.m ==0 and self.cm == 0 and self.ft ==0:
			self.e2.delete(0,'end')
			self.e3.delete(0,'end')
			self.e4.delete(0,'end')		
		
	def clear(self):
		self.e2.delete(0,'end')
		self.e3.delete(0,'end')
		self.e4.delete(0,'end')
	def quit(self):
		exit()
	def back(self):
		self.master1.withdraw()
		toplevel = Toplevel(self.master1)
		toplevel.resizable(0, 0)
		toplevel.geometry("600x500")
		app = MainWindow(toplevel)

class Mass:
	def __init__(self, master1):
		self.master1 = master1
		
		background_image2 = PhotoImage(file = image_path)
		background_label = Label(master1, image=background_image2)
		background_label.place(x=0, y=0,relwidth=1,relheight=1)
		background_label.photo = background_image2
		
		self.quitButton = Button(master1, text = 'Quit', width = 15, command = lambda:self.quit())
		self.quitButton.place(x=60,y=460)
		self.backButton = Button(master1, text = 'Back', width = 15, command = lambda:self.back())
		self.backButton.place(x=400,y=460)
		
		
		self.l1 = Label(master1,text = "Mass Converter",fg='white', bg='black')
		self.l1.place(x=200, y= 5)
		
		self.l2 = Label(master1,text = "Kg",fg='white', bg='black')
		self.l2.place(x=20, y= 40)
		
		vcmd = (master1.register(self.validate), '%d', '%i', '%P',  '%s', '%S', '%v', '%V', '%W')
		self.e2 = Entry(master1, bd =2,fg='white', bg='black',validate='key', validatecommand=vcmd)
		self.e2.place(x=100,y=40)
		self.e2.config(font=("Arial", 10))
		#self.e2.insert(END,'0')
		#m = e2.get()
		#print(m)
		
		self.l3 = Label(master1,text = "Gram",fg='white', bg='black')
		self.l3.place(x=20, y= 100)
		self.e3 = Entry(master1, bd =2,fg='white', bg='black',validate='key', validatecommand=vcmd)
		self.e3.place(x=100,y=100)
		self.e3.config(font=("Arial", 10))
		#self.e3.insert(END,'0')
		
		self.l4 = Label(master1,text = "Pound",fg='white', bg='black')
		self.l4.place(x=20, y= 160)
		self.e4 = Entry(master1, bd =2,fg='white', bg='black',validate='key', validatecommand=vcmd)
		self.e4.place(x=100,y=160)
		self.e4.config(font=("Arial", 10))
		#self.e4.insert(END,'0')
		
		self.convertButton = Button(master1, text = 'Convert', width = 15, command = lambda:self.ins())
		self.convertButton.place(x=225,y=400)	
		
		self.clearButton = Button(master1, text = 'Clear', width = 15, command = lambda:self.clear())
		self.clearButton.place(x=225,y=450)
		
	def validate(self, action, index, value_if_allowed, prior_value, text, validation_type, trigger_type, widget_name):
		if value_if_allowed:
			try:
				float(value_if_allowed)
				return True
			except ValueError:
				return False
			else:
				return False
		
	def ins(self):
		try:
			self.m = float( self.e2.get() )
		except:
			self.m = 0
		try:
			self.cm = float( self.e3.get() )
		except:
			self.cm = 0
		try:
			self.ft = float( self.e4.get() )
		except:
			self.ft = 0
		
		if (self.m !=0 and self.cm == 0 and self.ft ==0) or (self.m !=0 and self.cm != 0 and self.ft ==0) or (self.m != 0 and self.cm == 0 and self.ft !=0) or (self.m !=0 and self.cm != 0 and self.ft != 0):
			self.cm = float(self.m * 1000)
			self.ft = float(self.m * 2.20462)
			self.e2.delete(0,'end')
			self.e3.delete(0,'end')
			self.e4.delete(0,'end')
			self.e2.insert(END,str(self.m))
			self.e3.insert(END,str(self.cm))
			self.e4.insert(END,str(self.ft))
		elif (self.m ==0 and self.cm != 0 and self.ft ==0) or (self.m ==0 and self.cm != 0 and self.ft !=0):
			self.m = float(self.cm/1000)
			self.ft = float(self.m/2.20462)
			self.e2.delete(0,'end')
			self.e3.delete(0,'end')
			self.e4.delete(0,'end')
			self.e2.insert(END,str(self.m))
			self.e3.insert(END,str(self.cm))
			self.e4.insert(END,str(self.ft))
		elif self.m ==0 and self.cm == 0 and self.ft !=0:
			self.m = float(self.ft/2.20462)
			self.cm = float(self.ft*1000/2.2042)
			self.e2.delete(0,'end')
			self.e3.delete(0,'end')
			self.e4.delete(0,'end')
			self.e2.insert(END,str(self.m))
			self.e3.insert(END,str(self.cm))
			self.e4.insert(END,str(self.ft))		
		elif self.m ==0 and self.cm == 0 and self.ft ==0:
			self.e2.delete(0,'end')
			self.e3.delete(0,'end')
			self.e4.delete(0,'end')		
		
	def clear(self):
		self.e2.delete(0,'end')
		self.e3.delete(0,'end')
		self.e4.delete(0,'end')
	def quit(self):
		exit()    
	def back(self):
		self.master1.withdraw()
		toplevel = Toplevel(self.master1)
		toplevel.resizable(0, 0)
		toplevel.geometry("600x500")
		app = MainWindow(toplevel)
		
class Time:
	def __init__(self, master1):
		self.master1 = master1
		
		background_image2 = PhotoImage(file = image_path)
		background_label = Label(master1, image=background_image2)
		background_label.place(x=0, y=0,relwidth=1,relheight=1)
		background_label.photo = background_image2
		
		self.quitButton = Button(master1, text = 'Quit', width = 15, command = lambda:self.quit())
		self.quitButton.place(x=60,y=460)
		self.backButton = Button(master1, text = 'Back', width = 15, command = lambda:self.back())
		self.backButton.place(x=400,y=460)
		
		
		self.l1 = Label(master1,text = "Time Converter",fg='white', bg='black')
		self.l1.place(x=200, y= 5)
		
		self.l2 = Label(master1,text = "Hours",fg='white', bg='black')
		self.l2.place(x=20, y= 40)
		
		vcmd = (master1.register(self.validate), '%d', '%i', '%P',  '%s', '%S', '%v', '%V', '%W')
		self.e2 = Entry(master1, bd =2,fg='white', bg='black',validate='key', validatecommand=vcmd)
		self.e2.place(x=100,y=40)
		self.e2.config(font=("Arial", 10))
		#self.e2.insert(END,'0')
		#m = e2.get()
		#print(m)
		
		self.l3 = Label(master1,text = "Minutes",fg='white', bg='black')
		self.l3.place(x=20, y= 100)
		self.e3 = Entry(master1, bd =2,fg='white', bg='black',validate='key', validatecommand=vcmd)
		self.e3.place(x=100,y=100)
		self.e3.config(font=("Arial", 10))
		#self.e3.insert(END,'0')
		
		self.l4 = Label(master1,text = "Seconds",fg='white', bg='black')
		self.l4.place(x=20, y= 160)
		self.e4 = Entry(master1, bd =2,fg='white', bg='black',validate='key', validatecommand=vcmd)
		self.e4.place(x=100,y=160)
		self.e4.config(font=("Arial", 10))
		#self.e4.insert(END,'0')
		
		self.convertButton = Button(master1, text = 'Convert', width = 15, command = lambda:self.ins())
		self.convertButton.place(x=225,y=400)	
		
		self.clearButton = Button(master1, text = 'Clear', width = 15, command = lambda:self.clear())
		self.clearButton.place(x=225,y=450)
		
	def validate(self, action, index, value_if_allowed, prior_value, text, validation_type, trigger_type, widget_name):
		if value_if_allowed:
			try:
				float(value_if_allowed)
				return True
			except ValueError:
				return False
			else:
				return False
		
	def ins(self):
		try:
			self.m = float( self.e2.get() )
		except:
			self.m = 0
		try:
			self.cm = float( self.e3.get() )
		except:
			self.cm = 0
		try:
			self.ft = float( self.e4.get() )
		except:
			self.ft = 0
		
		if (self.m !=0 and self.cm == 0 and self.ft ==0) or (self.m !=0 and self.cm != 0 and self.ft ==0) or (self.m != 0 and self.cm == 0 and self.ft !=0) or (self.m !=0 and self.cm != 0 and self.ft != 0):
			self.cm = float(self.m * 60)
			self.ft = float(self.m *3600)
			self.e2.delete(0,'end')
			self.e3.delete(0,'end')
			self.e4.delete(0,'end')
			self.e2.insert(END,str(self.m))
			self.e3.insert(END,str(self.cm))
			self.e4.insert(END,str(self.ft))
		elif (self.m ==0 and self.cm != 0 and self.ft ==0) or (self.m ==0 and self.cm != 0 and self.ft !=0):
			self.m = float(self.cm/60)
			self.ft = float(self.m * 3600)
			self.e2.delete(0,'end')
			self.e3.delete(0,'end')
			self.e4.delete(0,'end')
			self.e2.insert(END,str(self.m))
			self.e3.insert(END,str(self.cm))
			self.e4.insert(END,str(self.ft))
		elif self.m ==0 and self.cm == 0 and self.ft !=0:
			self.m = float(self.ft/3600)
			self.cm = float(self.ft/60)
			self.e2.delete(0,'end')
			self.e3.delete(0,'end')
			self.e4.delete(0,'end')
			self.e2.insert(END,str(self.m))
			self.e3.insert(END,str(self.cm))
			self.e4.insert(END,str(self.ft))		
		elif self.m ==0 and self.cm == 0 and self.ft ==0:
			self.e2.delete(0,'end')
			self.e3.delete(0,'end')
			self.e4.delete(0,'end')		
		
	def clear(self):
		self.e2.delete(0,'end')
		self.e3.delete(0,'end')
		self.e4.delete(0,'end')
	def quit(self):
		exit()
	def back(self):
		self.master1.withdraw()
		toplevel = Toplevel(self.master1)
		toplevel.resizable(0, 0)
		toplevel.geometry("600x500")
		app = MainWindow(toplevel)
		
class Area:
	def __init__(self, master1):
		self.master1 = master1
		
		background_image2 = PhotoImage(file = image_path)
		background_label = Label(master1, image=background_image2)
		background_label.place(x=0, y=0,relwidth=1,relheight=1)
		background_label.photo = background_image2
		
		self.quitButton = Button(master1, text = 'Quit', width = 15, command = lambda:self.quit())
		self.quitButton.place(x=60,y=460)
		self.backButton = Button(master1, text = 'Back', width = 15, command = lambda:self.back())
		self.backButton.place(x=400,y=460)
		
		
		self.l1 = Label(master1,text = "Area Converter",fg='white', bg='black')
		self.l1.place(x=200, y= 5)
		
		self.l2 = Label(master1,text = "Square Meter",fg='white', bg='black')
		self.l2.place(x=20, y= 40)
		
		vcmd = (master1.register(self.validate), '%d', '%i', '%P',  '%s', '%S', '%v', '%V', '%W')
		self.e2 = Entry(master1, bd =2,fg='white', bg='black',validate='key', validatecommand=vcmd)
		self.e2.place(x=100,y=40)
		self.e2.config(font=("Arial", 10))
		#self.e2.insert(END,'0')
		#m = e2.get()
		#print(m)
		
		self.l3 = Label(master1,text = "Square Centimeter",fg='white', bg='black')
		self.l3.place(x=20, y= 100)
		self.e3 = Entry(master1, bd =2,fg='white', bg='black',validate='key', validatecommand=vcmd)
		self.e3.place(x=100,y=100)
		self.e3.config(font=("Arial", 10))
		#self.e3.insert(END,'0')
		
		self.l4 = Label(master1,text = "Square Feet",fg='white', bg='black')
		self.l4.place(x=20, y= 160)
		self.e4 = Entry(master1, bd =2,fg='white', bg='black',validate='key', validatecommand=vcmd)
		self.e4.place(x=100,y=160)
		self.e4.config(font=("Arial", 10))
		#self.e4.insert(END,'0')
		
		self.convertButton = Button(master1, text = 'Convert', width = 15, command = lambda:self.ins())
		self.convertButton.place(x=225,y=400)	
		
		self.clearButton = Button(master1, text = 'Clear', width = 15, command = lambda:self.clear())
		self.clearButton.place(x=225,y=450)
		
	def validate(self, action, index, value_if_allowed, prior_value, text, validation_type, trigger_type, widget_name):
		if value_if_allowed:
			try:
				float(value_if_allowed)
				return True
			except ValueError:
				return False
			else:
				return False
		
	def ins(self):
		try:
			self.m = float( self.e2.get() )
		except:
			self.m = 0
		try:
			self.cm = float( self.e3.get() )
		except:
			self.cm = 0
		try:
			self.ft = float( self.e4.get() )
		except:
			self.ft = 0
		
		if (self.m !=0 and self.cm == 0 and self.ft ==0) or (self.m !=0 and self.cm != 0 and self.ft ==0) or (self.m != 0 and self.cm == 0 and self.ft !=0) or (self.m !=0 and self.cm != 0 and self.ft != 0):
			self.cm = float((self.m * 100)**2)
			self.ft = float((self.m * 3.28084)**2)
			self.e2.delete(0,'end')
			self.e3.delete(0,'end')
			self.e4.delete(0,'end')
			self.e2.insert(END,str(self.m))
			self.e3.insert(END,str(self.cm))
			self.e4.insert(END,str(self.ft))
		elif (self.m ==0 and self.cm != 0 and self.ft ==0) or (self.m ==0 and self.cm != 0 and self.ft !=0):
			self.m = float((self.cm/100)**2)
			self.ft = float((self.m/3.28084)**2)
			self.e2.delete(0,'end')
			self.e3.delete(0,'end')
			self.e4.delete(0,'end')
			self.e2.insert(END,str(self.m))
			self.e3.insert(END,str(self.cm))
			self.e4.insert(END,str(self.ft))
		elif self.m ==0 and self.cm == 0 and self.ft !=0:
			self.m = float((self.ft/3.28084)**2)
			self.cm = float((self.ft*100/3.28084)**2)
			self.e2.delete(0,'end')
			self.e3.delete(0,'end')
			self.e4.delete(0,'end')
			self.e2.insert(END,str(self.m))
			self.e3.insert(END,str(self.cm))
			self.e4.insert(END,str(self.ft))		
		elif self.m ==0 and self.cm == 0 and self.ft ==0:
			self.e2.delete(0,'end')
			self.e3.delete(0,'end')
			self.e4.delete(0,'end')		
		
	def clear(self):
		self.e2.delete(0,'end')
		self.e3.delete(0,'end')
		self.e4.delete(0,'end')
	def quit(self):
		exit()
	def back(self):
		self.master1.withdraw()
		toplevel = Toplevel(self.master1)
		toplevel.resizable(0, 0)
		toplevel.geometry("600x500")
		app = MainWindow(toplevel)
		
class Volume:
	def __init__(self, master1):
		self.master1 = master1
		
		background_image2 = PhotoImage(file = image_path)
		background_label = Label(master1, image=background_image2)
		background_label.place(x=0, y=0,relwidth=1,relheight=1)
		background_label.photo = background_image2
		
		self.quitButton = Button(master1, text = 'Quit', width = 15, command = lambda:self.quit())
		self.quitButton.place(x=60,y=460)
		self.backButton = Button(master1, text = 'Back', width = 15, command = lambda:self.back())
		self.backButton.place(x=400,y=460)
		
		
		self.l1 = Label(master1,text = "Volume Converter",fg='white', bg='black')
		self.l1.place(x=200, y= 5)
		
		self.l2 = Label(master1,text = "Cube Meter",fg='white', bg='black')
		self.l2.place(x=20, y= 40)
		
		vcmd = (master1.register(self.validate), '%d', '%i', '%P',  '%s', '%S', '%v', '%V', '%W')
		self.e2 = Entry(master1, bd =2,fg='white', bg='black',validate='key', validatecommand=vcmd)
		self.e2.place(x=100,y=40)
		self.e2.config(font=("Arial", 10))
		#self.e2.insert(END,'0')
		#m = e2.get()
		#print(m)
		
		self.l3 = Label(master1,text = "Cube Centimeter",fg='white', bg='black')
		self.l3.place(x=20, y= 100)
		self.e3 = Entry(master1, bd =2,fg='white', bg='black',validate='key', validatecommand=vcmd)
		self.e3.place(x=100,y=100)
		self.e3.config(font=("Arial", 10))
		#self.e3.insert(END,'0')
		
		self.l4 = Label(master1,text = "Cube Feet",fg='white', bg='black')
		self.l4.place(x=20, y= 160)
		self.e4 = Entry(master1, bd =2,fg='white', bg='black',validate='key', validatecommand=vcmd)
		self.e4.place(x=100,y=160)
		self.e4.config(font=("Arial", 10))
		#self.e4.insert(END,'0')
		
		self.convertButton = Button(master1, text = 'Convert', width = 15, command = lambda:self.ins())
		self.convertButton.place(x=225,y=400)	
		
		self.clearButton = Button(master1, text = 'Clear', width = 15, command = lambda:self.clear())
		self.clearButton.place(x=225,y=450)
		
	def validate(self, action, index, value_if_allowed, prior_value, text, validation_type, trigger_type, widget_name):
		if value_if_allowed:
			try:
				float(value_if_allowed)
				return True
			except ValueError:
				return False
			else:
				return False
		
	def ins(self):
		try:
			self.m = float( self.e2.get() )
		except:
			self.m = 0
		try:
			self.cm = float( self.e3.get() )
		except:
			self.cm = 0
		try:
			self.ft = float( self.e4.get() )
		except:
			self.ft = 0
		
		if (self.m !=0 and self.cm == 0 and self.ft ==0) or (self.m !=0 and self.cm != 0 and self.ft ==0) or (self.m != 0 and self.cm == 0 and self.ft !=0) or (self.m !=0 and self.cm != 0 and self.ft != 0):
			self.cm = float((self.m * 100)**3)
			self.ft = float((self.m * 3.28084)**3)
			self.e2.delete(0,'end')
			self.e3.delete(0,'end')
			self.e4.delete(0,'end')
			self.e2.insert(END,str(self.m))
			self.e3.insert(END,str(self.cm))
			self.e4.insert(END,str(self.ft))
		elif (self.m ==0 and self.cm != 0 and self.ft ==0) or (self.m ==0 and self.cm != 0 and self.ft !=0):
			self.m = float((self.cm/100)**3)
			self.ft = float((self.m/3.28084)**3)
			self.e2.delete(0,'end')
			self.e3.delete(0,'end')
			self.e4.delete(0,'end')
			self.e2.insert(END,str(self.m))
			self.e3.insert(END,str(self.cm))
			self.e4.insert(END,str(self.ft))
		elif self.m ==0 and self.cm == 0 and self.ft !=0:
			self.m = float((self.ft/3.28084)**3)
			self.cm = float((self.ft*100/3.28084)**3)
			self.e2.delete(0,'end')
			self.e3.delete(0,'end')
			self.e4.delete(0,'end')
			self.e2.insert(END,str(self.m))
			self.e3.insert(END,str(self.cm))
			self.e4.insert(END,str(self.ft))		
		elif self.m ==0 and self.cm == 0 and self.ft ==0:
			self.e2.delete(0,'end')
			self.e3.delete(0,'end')
			self.e4.delete(0,'end')		
		
	def clear(self):
		self.e2.delete(0,'end')
		self.e3.delete(0,'end')
		self.e4.delete(0,'end')
	def quit(self):
		exit()
	def back(self):
		self.master1.withdraw()
		toplevel = Toplevel(self.master1)
		toplevel.resizable(0, 0)
		toplevel.geometry("600x500")
		app = MainWindow(toplevel)

class Number:
	def __init__(self, master1):
		self.master1 = master1
		
		background_image2 = PhotoImage(file = image_path)
		background_label = Label(master1, image=background_image2)
		background_label.place(x=0, y=0,relwidth=1,relheight=1)
		background_label.photo = background_image2
		
		self.quitButton = Button(master1, text = 'Quit', width = 15, command = lambda:self.quit())
		self.quitButton.place(x=60,y=460)
		self.backButton = Button(master1, text = 'Back', width = 15, command = lambda:self.back())
		self.backButton.place(x=400,y=460)
		
		
		self.l1 = Label(master1,text = "Number Converter",fg='white', bg='black')
		self.l1.place(x=200, y= 5)
		
		self.l2 = Label(master1,text = "Decimal",fg='white', bg='black')
		self.l2.place(x=20, y= 40)
		
		vcmd = (master1.register(self.validate), '%d', '%i', '%P',  '%s', '%S', '%v', '%V', '%W')
		self.e2 = Entry(master1, bd =2,fg='white', bg='black',validate='key', validatecommand=vcmd)
		self.e2.place(x=100,y=40)
		self.e2.config(font=("Arial", 10))
		#self.e2.insert(END,'0')
		#m = e2.get()
		#print(m)
		
		self.l3 = Label(master1,text = "Binary",fg='white', bg='black')
		self.l3.place(x=20, y= 100)
		self.e3 = Entry(master1, bd =2,fg='white', bg='black',validate='key', validatecommand=vcmd)
		self.e3.place(x=100,y=100)
		self.e3.config(font=("Arial", 10))
		#self.e3.insert(END,'0')
		
		self.l4 = Label(master1,text = "Hexadecimal",fg='white', bg='black')
		self.l4.place(x=25, y= 160)
		self.e4 = Entry(master1, bd =2,fg='white', bg='black',validate='key', validatecommand=vcmd)
		self.e4.place(x=120,y=160)
		self.e4.config(font=("Arial", 10))
		#self.e4.insert(END,'0')
		
		self.convertButton = Button(master1, text = 'Convert', width = 15, command = lambda:self.ins())
		self.convertButton.place(x=225,y=400)	
		
		self.clearButton = Button(master1, text = 'Clear', width = 15, command = lambda:self.clear())
		self.clearButton.place(x=225,y=450)
		
	def validate(self, action, index, value_if_allowed, prior_value, text, validation_type, trigger_type, widget_name):
		if value_if_allowed:
			try:
				float(value_if_allowed)
				return True
			except ValueError:
				return False
			else:
				return False
		
	def ins(self):
		try:
			self.dec = int( self.e2.get() )
		except:
			self.dec = 0
		try:
			self.bin = int( self.e3.get() )
		except:
			self.bin = 0
		try:
			self.hex = int( self.e4.get() )
		except:
			self.hex = 0
		
		if (self.dec !=0 and self.bin == 0 and self.hex ==0) or (self.dec !=0 and self.bin != 0 and self.hex ==0) or (self.dec != 0 and self.bin == 0 and self.hex !=0) or (self.dec !=0 and self.bin != 0 and self.hex != 0):
			self.bin = bin(int(self.dec)).replace("0b", "")
			self.hex = hex(self.dec).replace("0x", "")
			self.e2.delete(0,'end')
			self.e3.delete(0,'end')
			self.e4.delete(0,'end')
			self.e2.insert(END,str(self.dec))
			self.e3.insert(END,str(self.bin))
			self.e4.insert(END,str(self.hex))
			
		if (self.dec ==0 and self.bin != 0 and self.hex ==0) or (self.dec ==0 and self.bin != 0 and self.hex !=0):
			self.dec = int(str(self.dec),2)
			self.hex = hex(self.dec).replace("0x", "")
			self.e2.delete(0,'end')
			self.e3.delete(0,'end')
			self.e4.delete(0,'end')
			self.e2.insert(END,str(self.dec))
			self.e3.insert(END,str(self.bin))
			self.e4.insert(END,str(self.hex))
			
		if (self.dec ==0 and self.bin == 0 and self.hex !=0):
			self.dec = int(str(self.hex), 16)
			self.bin = bin(self.dec).replace("0b", "")
			self.e2.delete(0,'end')
			self.e3.delete(0,'end')
			self.e4.delete(0,'end')
			self.e2.insert(END,str(self.dec))
			self.e3.insert(END,str(self.bin))
			self.e4.insert(END,str(self.hex))
		
		
		
		
	def clear(self):
		self.e2.delete(0,'end')
		self.e3.delete(0,'end')
		self.e4.delete(0,'end')
	def quit(self):
		exit()
	def back(self):
		self.master1.withdraw()
		toplevel = Toplevel(self.master1)
		toplevel.resizable(0, 0)
		toplevel.geometry("600x500")
		app = MainWindow(toplevel)
		

root = Tk()
root.title("My Unit Converter")
icon = PhotoImage(file = icon_path)
root.iconphoto(False, icon)
root.geometry("600x500")
root.resizable(0, 0) #Don't allow the resizing window

cls = MainWindow(root)
root.mainloop()
