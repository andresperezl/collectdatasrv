# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
w = Math.max(document.documentElement.clientWidth, window.innerWidth || 0) - 16
h = -> Math.max(document.documentElement.clientHeight, window.innerHeight || 0) - 40
$(document).on 'change', '#experiment_id', ->
	if $(this).val()
		$.ajax
			url: "experiment/" + $(this).val() + ".json"
			dataType: "json"
			success: (data, textStatus, jqXHR) ->
	     		drawEnergyGraph(data["data"]["phone_acc"], "Acceleration Sensor (Phone)", "phone_acc_chart")
	     		$("#phone_acc_stats").html("Avg. Sampling Rate: "+data["stats"]["phone_acc"]["rate"])
	     		drawEnergyGraph(data["data"]["phone_gyr"], "Gyroscope Sensor (Phone)", "phone_gyr_chart")
	     		$("#phone_gyr_stats").html("Avg. Sampling Rate: "+data["stats"]["phone_gyr"]["rate"])
	     		drawEnergyGraph(data["data"]["strap_acc"], "Acceleration Sensor (Strap)", "strap_acc_chart")
	     		$("#strap_acc_stats").html("Avg. Sampling Rate: "+data["stats"]["strap_acc"]["rate"])

google.load 'visualization', '1.1', packages: ['line']

drawEnergyGraph = (values, title, chartdiv_id) ->
	data = new google.visualization.DataTable()
	data.addColumn("number", "Time (ns)")
	data.addColumn("number", "Energy")
	data.addColumn("number", "Filtered Energy")
	data.addRows(values)
	options =
		chart:
			title: title
		height: h()/2
		explorer:
			actions: ['dragToZoom', 'rightClickToReset']
			keepInBounds: true
		forceIFrame: true
		hAxis:
			format: "###########"


	chart = new google.charts.Line(document.getElementById(chartdiv_id))
	chart.draw(data, google.charts.Line.convertOptions(options))