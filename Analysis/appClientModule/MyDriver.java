import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.*;
import org.apache.hadoop.mapred.*;

public class MyDriver {

	public static void main(String arg[]) {

		JobConf conf = new JobConf(MyDriver.class);
		conf.setMapperClass(MyMapper.class);
		conf.setReducerClass(MyReducer.class);
		conf.setMapOutputKeyClass(Text.class);
		conf.setMapOutputValueClass(IntWritable.class);
		conf.setOutputKeyClass(Text.class);
		conf.setOutputValueClass(IntWritable.class);
		FileInputFormat.setInputPaths(conf, new Path(arg[1]));
		FileOutputFormat.setOutputPath(conf, new Path(arg[2]));
		try {
			JobClient.runJob(conf);
		} catch (Exception e) {

		}

	}
}
