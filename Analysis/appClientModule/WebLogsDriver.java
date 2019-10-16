import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.conf.Configured;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.mapred.FileInputFormat;
import org.apache.hadoop.mapred.FileOutputFormat;
import org.apache.hadoop.mapred.JobClient;
import org.apache.hadoop.mapred.JobConf;
import org.apache.hadoop.mapred.TextOutputFormat;
import org.apache.hadoop.util.Tool;
import org.apache.hadoop.util.ToolRunner;

import com.sun.jersey.core.impl.provider.entity.XMLJAXBElementProvider.Text;

public class WebLogsDriver extends Configured implements Tool {
	public static void main(String arg[]) {
		try {
			ToolRunner.run(new Configuration(), new WebLogsDriver(), arg);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public int run(String[] arg0) throws Exception {
		Configuration conf = getConf();

		// Create a job from the default configuration that will use the
		// WordCount class
		JobConf job = new JobConf(conf, WebLogsDriver.class);

		// Define our input path as the first command line argument and our
		// output path as the second
		Path in = new Path("input");
		Path out = new Path("output");

		// Create File Input/Output formats for these paths (in the job)
		FileInputFormat.setInputPaths(job, in);
		FileOutputFormat.setOutputPath(job, out);

		// Configure the job: name, mapper, reducer, and combiner
		job.setJobName("WEBLogs");
		job.setMapperClass(WebLogsMapper.class);
		job.setReducerClass(WebLogsReducer.class);
		// job.setCombinerClass(WebLogsReducer.class);

		// Configure the output
		job.setOutputFormat(TextOutputFormat.class);
		job.setOutputKeyClass(Text.class);
		job.setOutputValueClass(LongWritable.class);

		// Run the job
		JobClient.runJob(job);

		return 0;
	}
}
