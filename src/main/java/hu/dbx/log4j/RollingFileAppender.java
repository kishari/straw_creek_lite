package hu.dbx.log4j;


import java.io.FilenameFilter;
import java.io.IOException;
import java.io.Writer;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;

import org.apache.log4j.FileAppender;
import org.apache.log4j.Layout;
import org.apache.log4j.helpers.OptionConverter;
import org.apache.log4j.helpers.LogLog;
import org.apache.log4j.helpers.CountingQuietWriter;
import org.apache.log4j.spi.LoggingEvent;


public class RollingFileAppender extends FileAppender {

  protected long maxFileSize = 10*1024*1024;

  protected int  maxBackupIndex  = 1;
  
  protected boolean backupIsLimited = true;

  protected String dateFormat = "yyyy-MM-dd_HH-mm-ss";

  public  RollingFileAppender() {
    super();
  }

  public  RollingFileAppender(Layout layout, String filename, boolean append) throws IOException {
    super(layout, filename, append);
  }

  public  RollingFileAppender(Layout layout, String filename) throws IOException {
    super(layout, filename);
  }


//synchronization not necessary since doAppend is alreasy synched
  public void rollOver() {
	  File target;
	  File file;
	  
	  SimpleDateFormat formatter = new SimpleDateFormat(dateFormat);
	  
	  String nowAsString = formatter.format(new Date());
	  
	  final String logFileName = new String(fileName.substring(fileName.lastIndexOf("/") + 1));
	  
	  file = new File(fileName);
      
      File dir = new File(file.getParent());
      
      file = null;
      
      File dailyDir = new File(dir, nowAsString.substring(0, nowAsString.lastIndexOf("_")));
      
      if (!dailyDir.exists()) {
    	  dailyDir.mkdir();
      }
      else if (!dailyDir.isDirectory()){
    	  dailyDir.delete();
    	  dailyDir.mkdir();
      }
      
      target = new File(dailyDir, logFileName + "." + nowAsString);
      
      if (backupIsLimited) {
	      File[] logFiles = dailyDir.listFiles(new FilenameFilter() {
				public boolean accept(final File dir, final String name) {
					return name.startsWith(logFileName);
				}
	      });
	      
		  if(maxBackupIndex > 0) {		      
		      FileLastModifiedComparator c = new FileLastModifiedComparator();			      
		      //Rendezzük lastModified szerint csökkenően!
		      Arrays.sort(logFiles, c);
		      
		      if (logFiles.length > maxBackupIndex) {//Kitöröljük a legrégebbi logokat 
		    	  									 //amikor először fut, és több log van, mint a megengedett, ez akkor lesz igaz!
			      
			      for (int i = logFiles.length - 1; i >= maxBackupIndex; i--) {
			    	  logFiles[i].delete();
			      }
		      }
		      
		      if (logFiles.length > maxBackupIndex - 1) {
		    	  logFiles[maxBackupIndex - 1].delete();
		      }
		      
		      this.closeFile(); // keep windows happy.

		      file = new File(fileName);
		      LogLog.debug("Renaming file " + file + " to " + target);
		      file.renameTo(target);
		  }
		  else {
			  //maxBackupIndex <= 0
			  //Ilyet ne akarjon senki, mert amikor megtelik a file, akkor simán felülírja egy újjal!
		  }
	  }
	  else {
		  //backupIsLimited = false
	      this.closeFile(); // keep windows happy.

	      file = new File(fileName);
	      LogLog.debug("Renaming file " + file + " to " + target);
	      file.renameTo(target);
	  }
	  
      try {
	     // This will also close the file. This is OK since multiple
	     // close operations are safe.
	     this.setFile(fileName, false, bufferedIO, bufferSize);
	  }
	  catch(IOException e) {
	     LogLog.error("setFile("+fileName+", false) call failed.", e);
	  }


  }

  public synchronized void setFile(String fileName, boolean append, boolean bufferedIO, int bufferSize) throws IOException {
    super.setFile(fileName, append, this.bufferedIO, this.bufferSize);
    if(append) {
      File f = new File(fileName);
      ((CountingQuietWriter) qw).setCount(f.length());
    }
  }

  public  int getMaxBackupIndex() {
    return maxBackupIndex;
  }
  
  public void setMaxBackupIndex(int maxBackups) {
	    this.maxBackupIndex = maxBackups;
  }

  public  long getMaximumFileSize() {
    return maxFileSize;
  }
  
  public void setMaximumFileSize(long maxFileSize) {
	    this.maxFileSize = maxFileSize;
  }
  
  public boolean isBackupIsLimited() {
	  return backupIsLimited;
  }
  
  public void setBackupIsLimited(boolean backupIsLimited) {
	  this.backupIsLimited = backupIsLimited;
  }

  public String getDateFormat() {
	  return dateFormat;
  }

  public void setDateFormat(String dateFormat) {
	  this.dateFormat = dateFormat;
  }
	
  public void setMaxFileSize(String value) {
    maxFileSize = OptionConverter.toFileSize(value, maxFileSize + 1);
  }

  protected void setQWForFiles(Writer writer) {
     this.qw = new CountingQuietWriter(writer, errorHandler);
  }

  protected void subAppend(LoggingEvent event) {
    super.subAppend(event);
    if((fileName != null) &&
                     ((CountingQuietWriter) qw).getCount() >= maxFileSize)
      this.rollOver();
   }
  
}

