import java.io.IOException;
import java.util.Iterator;

import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapred.MapReduceBase;
import org.apache.hadoop.mapred.OutputCollector;
import org.apache.hadoop.mapred.Reducer;
import org.apache.hadoop.mapred.Reporter;

public class WebLogsReducer extends MapReduceBase implements
		Reducer<Text, Text, Text, LongWritable> {

	@Override
	public void reduce(Text date, Iterator<Text> ips,
			OutputCollector<Text, LongWritable> output, Reporter report)
			throws IOException {

		int i = 0;
		while (ips.hasNext()) {
			i++;
			ips.next();
		}
		output.collect(date, new LongWritable(i));
	}

}





num_of_3 = int(n/3)

sum = 0

for i in range(0,num_of_3+1):

	n_c = n - (i*3)) +i
	

	sum += (factorial(n_c)/(factorial(i)*factorial(n-i))


return sum