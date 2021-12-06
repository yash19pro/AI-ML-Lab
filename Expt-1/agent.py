import requests
import random
import time

API = "https://api.openweathermap.org/data/2.5/weather?q=India&appid=66393efdc891a96ae1ccbb315a72c37f"

def setMyRoomConditions():
	def convertFtoC(F):
		C = (F - 32) / 9
		return C

	def getWeatherTemperature():
		response = requests.get(url=API)
		responseJSON = response.json()
		weatherTemperature = responseJSON['main']['temp']
		return weatherTemperature

	def getRoomTemperature():
		# we can fetch the data from the sensor about the room temperature
		# due to unavailability of the sensors, a random number is chosen by default
		return random.randint(0, 27)

	def setRoomTemperature(currentWeatherTemperature):
		return round(54 - currentWeatherTemperature, 2)

	currentRoomTemperature = getRoomTemperature()
	currentWeatherTemperature = getWeatherTemperature()
	currentWeatherTemperature = convertFtoC(currentWeatherTemperature)
	newTemperature = setRoomTemperature(currentWeatherTemperature)

	print('Current Room Temperature is ' + str(round(currentRoomTemperature, 2)))
	print('Current Weather Temperature is ' + str(round(currentWeatherTemperature, 2)))
	if newTemperature > currentRoomTemperature:
		# sending a command to the system to raise the temperature
		print("Increasing the room temperature by " + str(round(newTemperature - currentRoomTemperature, 2)))
	elif newTemperature < currentRoomTemperature:
		# sending a command to the system to drop the temperature
		print("Dropping the room temperature by " + str(round(currentRoomTemperature - newTemperature, 2)))
	else:
		# all cool, relax!
		print("Conditions are alright! Sit back and relax!")

while(True):
	setMyRoomConditions()
	time.sleep(10)