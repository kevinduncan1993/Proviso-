package bean;

import java.util.Calendar;

public class CalendarGenerator {
	
	
	public CalendarGenerator() {
		
	}
	
	public static String generateMonth(int month) {
		StringBuilder string = new StringBuilder();
		
		/*int column = 1;
		int day = 1;
		while(true) {
		out.print("<tr>");
		while(day <= 31){
			out.print("<td>"+day+"</td>");
			if(column % 7 == 0) {
		break;
			}
			day++;
			column++;
		}
		out.print("</tr>");
		}*/
		
		Calendar date = Calendar.getInstance();
		date.set(Calendar.MONTH, month);
		date.set(Calendar.DAY_OF_MONTH, 1);
		
		string.append("<table><tr><td>Sun</td><td>Mon</td><td>Tue</td><td>Wed</td><td>Thu</td><td>Fri</td><td>Sat</td></tr>");

		string.append("<tr>");
		int column = date.get(Calendar.DAY_OF_WEEK);
		for (int space = 1; space < column; space++) {
			string.append("<td class=\"td-invisable\"></td>");
		}
		int max = date.getActualMaximum(Calendar.DAY_OF_MONTH);
		for (int day = 1; day <= max; day++) {
			string.append("<td>" + day + "</td>");

			if (column % 7 == 0 && day < max) {
				string.append("</tr>");

				if (day <= max) {
					string.append("<tr>");
				}
			}
			column++;
		}
		
		string.append("</table>");
		return string.toString();
	}
}
