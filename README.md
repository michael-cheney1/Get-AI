# Get-AI
Basic PowerShell interaction with openai.com API

## Get Started
1. Go to https://beta.openai.com/signup and signup and get your own API Key
2. Put the API key into the $APIKey variable in the script or specify it as a parameter each time it's used. 
3. Run a query

## Examples
* Run a query specifying your API key

`Get-AI -Query 'Write a PowerShell script to calculate leap years' -API 'YOUR_API_KEY'`

![image](https://user-images.githubusercontent.com/121982191/210658718-be2bbd06-abe1-4deb-a4da-9ddd306665fb.png)

* Run a simple query (First parameter is the Query by default, API Key specified in the function)

`Get-AI 'Write a bash while loop'`

![image](https://user-images.githubusercontent.com/121982191/210659486-ba769581-a859-41af-98b8-e8622da7a1a8.png)
