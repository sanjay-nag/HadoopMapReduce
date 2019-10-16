import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.StringTokenizer;

import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapred.MapReduceBase;
import org.apache.hadoop.mapred.Mapper;
import org.apache.hadoop.mapred.OutputCollector;
import org.apache.hadoop.mapred.Reporter;

public class WebLogsMapper extends MapReduceBase implements
		Mapper<LongWritable, Text, Text, Text> {

	@Override
	public void map(LongWritable offset, Text val,
			OutputCollector<Text, Text> output, Reporter report)
			throws IOException {
		try {

			String line = val.toString();
			StringTokenizer tokens = new StringTokenizer(line);
			String ip = tokens.nextToken();
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

				output.collect(new Text(time), new Text(ip));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
