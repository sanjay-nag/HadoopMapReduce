import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.StringTokenizer;

import org.apache.hadoop.io.*;
import org.apache.hadoop.mapred.*;

public class MyMapper extends MapReduceBase implements
		Mapper<LongWritable, Text, Text, IntWritable> {

	public void map(LongWritable inputKey, Text inputValue,
			OutputCollector<Text, IntWritable> output, Reporter report)
			throws IOException {

		try {

			String line = inputValue.toString();
			//StringTokenizer tokens = new StringTokenizer(line);
			//String ip = tokens.nextToken();
			int openBracket = line.indexOf('[');
			int closeBracket = line.indexOf(']');
			if (openBracket != -1 && closeBracket != -1) {
				String dateString = line.substring(line.indexOf('[') + 1,
						line.indexOf(']'));

				SimpleDateFormat sdf = new SimpleDateFormat(
						"dd/MMM/yyyy:hh:mm:ss");
				Calendar c = Calendar.getInstance();
				c.setTime(sdf.parse(dateString));
				c.set(Calendar.MINUTE, 0);
				c.set(Calendar.SECOND, 0);
				SimpleDateFormat sdf2 = new SimpleDateFormat(
						"yyyy-MM-dd hh:mm:ss");
				String time = sdf2.format(c.getTime());
				DateWritable date = new DateWritable();
				date.setDate(c.getTime());

				output.collect(new Text(time), new IntWritable(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
