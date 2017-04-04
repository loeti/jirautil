# jirautil

*jirautil* helps to convert a Json export file of a Jira project to be importable by  Jira again. It's designed to run on a Linux and macOS.

```
Usage:

$ ./jirautil

Commands:

+ dates - Converts all date values in Jira's json export file to a simple date format importable by Jira again. The converted json file is printed to the console output. Milliseconds since epoch -> yyyy-MM-dd'T'HH:mm:ss.SSSZ e.g. 1472658552478 -> 2016-08-31T17:49:12.478+0200
```

```
Usage:

$ .build/debug/jirautil dates <input>

Arguments:

input - path to json input file.

Options:
--prettyPrinted [default: false] - pretty printed output
```

