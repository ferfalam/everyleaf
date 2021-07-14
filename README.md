# README  

Model : User  
User_columns  
>>id : int  
>>username : string  
>>password : string  
  
Model : Task  
Task_columns  
>>id : int  
>>name : string  
>>description : text  
>>deadline : date  
>>status : string  
>>priority : boolean  
>>tag_id : id  
>>user_id : int  

Model : Tag  
Tags_column  
>>id : int  
>>tag : string  

# DEPLOY TO HEROKU  

>>Gem version : 3.2.23  
>>heroku create (create an application on heroku)  
>>rails assets:precompile RAILS_ENV=production (compile the assets)  
>>git add -A   
>>git commit -m "init"  
>>heroku buildpacks:set heroku/ruby  
>>heroku buildpacks:add --index 1 heroku/nodejs  
>>git push heroku master  