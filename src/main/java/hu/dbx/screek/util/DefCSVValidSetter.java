package hu.dbx.screek.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.joda.time.DateTime;

import au.com.bytecode.opencsv.CSVReader;

public class DefCSVValidSetter {
	
	private List<String[]> modifyValidDateColumn(List<String[]> rows, DateTime newValidDate, String columnName) throws IOException {
		
		String newValidDateAsString = new String(Integer.toString(newValidDate.getYear()) + "-");
		
		String month = new String(Integer.toString(newValidDate.getMonthOfYear()) + "-");		
		if (newValidDate.getMonthOfYear() < 10) {
			month = "0" + month;
		}
		
		String day = new String(Integer.toString(newValidDate.getDayOfMonth()));
		if (newValidDate.getDayOfMonth() < 10) {
			day = "0" + day;
		}
		
		newValidDateAsString += month + day;
			
		String[] header = rows.get(0);
		List<String[]> rowsWithoutHeader = new ArrayList<String[]>(rows);
		rowsWithoutHeader.remove(0);
		
		if (Arrays.asList(header).contains(columnName)) {
				
			List<String[]> modifiedRows = new ArrayList<String[]>();
		
			for (String[] row : rowsWithoutHeader) {			
				for (int i = 0; i < row.length; i++) {
					if (columnName.equals(header[i])) {
						row[i] = newValidDateAsString;
						modifiedRows.add(row);
					} 
				}
			}
		
			modifiedRows.add(0, header);
			
			return modifiedRows;
		}
		
		return rows;
	}
	
	private void buildNewCsv(File outputDir, File csvFile, List<String[]> rows) throws IOException {
		File genCSVFile = new File(outputDir, csvFile.getName() );
		
		Writer writer = null;
		writer = new BufferedWriter(new FileWriter(genCSVFile));
		
		String head = new String();
		
		String[] header = rows.get(0);
		rows.remove(0);
		
		for (int i = 0; i < header.length; i++) {
			head += "\"" + header[i] + "\"";
			if (i < header.length - 1) {
				head += ";";
			}
			else {
				head += "\n";
			}
		}
		//System.out.println(head);
		
		writer.write(head);
		
		for (String[] row : rows) {
			String rowAsString = new String();
			
			for (int i = 0; i < header.length; i++) {
				rowAsString += "\"" + row[i] + "\"";
				if (i < header.length - 1) {
					rowAsString += ";";
				}
				else {
					rowAsString += "\n";
				}
			}
			
			writer.write(rowAsString);
		}
		
			
		writer.close();
		
	}
	
	private List<String[]> parseCSV(File csvFile) throws IOException {
		CSVReader reader = new CSVReader(new FileReader(csvFile), ';');		
		List<String[]> rows = reader.readAll();
		
		return rows;
	}
	
	public static void main(String[] args) {
		DefCSVValidSetter setter = new DefCSVValidSetter();
		
		File csvDir = new File("./data/csv");
		File outputDir = new File(csvDir, "output");
		outputDir.mkdir();
		
		if (!csvDir.isDirectory()) {
			System.out.println("A bemenetnek könyvtárat kell megadni!");
			return;
		}
		
		 File[] csvFiles = csvDir.listFiles();
		for (File f : csvFiles) {
			try {
				if (f.isFile()) {
					List<String[]> rows = setter.parseCSV(f);
					rows = setter.modifyValidDateColumn(rows, new DateTime(1986, 2, 5, 0, 0, 0, 0), "VALID_FROM");
					rows = setter.modifyValidDateColumn(rows, new DateTime(1900, 1, 1, 0, 0, 0, 0), "VALID_TO");
					
					setter.buildNewCsv(outputDir, f, rows);
				}				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

}
