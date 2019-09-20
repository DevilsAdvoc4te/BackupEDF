# Robocopy and EDF

This is a simple powershell script to run robocopy to mirror a games folder on another drive. It then collects the static's from the robocopy generated log file, stores this into a hashtable, and reports the data to an N-central server.

Much of this is educational tool for myself on how I can make a simple backup process much more difficult.

Future nice to haves will include:

1. Storing SHA1 of all the files
    1. This should involve storing to a file
    2. Reading from said stored file
2. Comparing the SHA1 with a previous list
    1. Differences between Compare and Equals
3. Future endeavors will be to convert to Java, Python, Golang, and C# (possibly more)
4. Considerations should include running microservices from Cloud, and local Containers
