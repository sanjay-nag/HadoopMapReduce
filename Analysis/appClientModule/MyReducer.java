import java.io.IOException;
import java.util.Iterator;

import org.apache.hadoop.io.*;
import org.apache.hadoop.mapred.*;

public class MyReducer extends MapReduceBase implements
		Reducer<Text, IntWritable, Text, IntWritable> {

	public void reduce(Text inputKey, Iterator<IntWritable> inputValues,
			OutputCollector<Text, IntWritable> output, Reporter report)
			throws IOException {


		int i = 0;
		while (inputValues.hasNext()) {
			i++;
			inputValues.next();
		}
		output.collect(inputKey, new IntWritable(i));
	}
}
