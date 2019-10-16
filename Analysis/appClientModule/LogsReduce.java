import java.io.IOException;
import java.util.Iterator;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.mapred.MapReduceBase;
import org.apache.hadoop.mapred.OutputCollector;
import org.apache.hadoop.mapred.Reducer;
import org.apache.hadoop.mapred.Reporter;

public class LogsReduce extends MapReduceBase implements
		Reducer<DateWritable, IntWritable, DateWritable, IntWritable> {
	public void reduce(DateWritable key, Iterator<IntWritable> values,
			OutputCollector<DateWritable, IntWritable> output, Reporter reporter)
			throws IOException {
		// Iterate over all of the values (counts of occurrences of this
		// word)
		int count = 0;
		while (values.hasNext()) {
			// Add the value to our count
			count += values.next().get();
		}

		// Output the word with its count (wrapped in an IntWritable)
		output.collect(key, new IntWritable(count));
	}
}
