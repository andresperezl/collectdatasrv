# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'change', '#experiment_id', ->
	if $(this).val()
		$.ajax
			url: "experiment/" + $(this).val() + ".json"
			dataType: "json"
			success: (data, textStatus, jqXHR) ->
	     		drawGraphXYZ(data["data"]["phone_acc"], "Acceleration Sensor (Phone)", "phone_acc_chart")


google.load 'visualization', '1.1', packages: ['line']

drawGraphXYZ = (values, title, chartdiv_id) ->
	data = new google.visualization.DataTable()
	data.addColumn("number", "Time (ms)")
	data.addColumn("number", "X")
	data.addColumn("number", "Y")
	data.addColumn("number", "Z")
	data.addRows(values)

	dataX = data.clone()
	dataX.removeColumns 2, 2
	options =
		chart:
			title: title + " X"
		height: 250
	chart = new google.charts.Line(document.getElementById(chartdiv_id+"_x"))
	chart.draw(dataX,options)

	dataY = data.clone()
	dataY.removeColumn 1
	dataY.removeColumn 2
	options =
		chart:
			title: title + " Y"
		colors: ['red']
		height: 250
	chart = new google.charts.Line(document.getElementById(chartdiv_id+"_y"))
	chart.draw(dataY,options)

	dataZ = data.clone()
	dataZ.removeColumns 1, 2
	options =
		chart:
			title: title + " Z"
		colors: ['orange']
		height: 250
	chart = new google.charts.Line(document.getElementById(chartdiv_id+"_z"))
	chart.draw(dataZ,options)