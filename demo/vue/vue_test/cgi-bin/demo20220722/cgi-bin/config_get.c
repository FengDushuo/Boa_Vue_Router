#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
//#include "cgic.h"
#include "cJSON.h"

int login()
{
	int length;
	char *method = NULL;
	char *inputstring = NULL;
	cJSON* cjson_test = NULL;
	cJSON* cjson_username = NULL;
	cJSON* cjson_password = NULL;
	cJSON* cjson_return = NULL;
	char* ret_str = NULL;
	cjson_return = cJSON_CreateObject();
	method = getenv("REQUEST_METHOD"); 
	//printf("<meta http-equiv=\"Content-Type\" content=\"text/html;charset=utf-8\">");
		printf("%s%c%c\n",
			"Content-Type:text/html;charset=iso-8859-1", 13, 10);

	//cgiHeaderContentType("text/html");
	if (method == NULL){
		cJSON_AddStringToObject(cjson_return, "code", "error");
		//printf("method is null");
		return 1;      
	}
	if (!strcmp(method, "POST"))   
	{
		length = atoi(getenv("CONTENT_LENGTH")); 
		if (length != 0)
		{
			//printf("len:%d", length);
			inputstring = (char *)malloc(sizeof(char)*(length + 1)); 
			memset(inputstring,0,(length+1));
			
			//fread(inputstring, sizeof(char), length, stdin);

			int result = fread(inputstring, 1, length, stdin);

			//printf("result : %d\n", result);
			if (result != length)
			{
				fputs("Reading error", stderr);
				exit(3);
			}

			//printf("ok");
		
		}
	}
	else if (!strcmp(method, "GET"))
	{
		inputstring = getenv("QUERY_STRING");
		length = strlen(inputstring);
	}
	if (length == 0)
		return 0;
	//printf("data:%s\n", inputstring);
	cjson_test = cJSON_Parse(inputstring);
	if(NULL == cjson_test)
	{
		cJSON_AddStringToObject(cjson_return, "code", "error");
        	//printf("parse fail.\n");
        	return -1;
	}
	cjson_username = cJSON_GetObjectItem(cjson_test, "username");
	cjson_password = cJSON_GetObjectItem(cjson_test, "password");
	//printf("username: %s\n", cjson_username->valuestring);
	//printf("password: %s\n", cjson_password->valuestring);
	if(NULL == cjson_username || NULL == cjson_password)
        {
		cJSON_AddStringToObject(cjson_return, "code", "error");
		//printf("no name or no pwd");
                return -1;
        }

        if(0 == strncmp(cjson_username->valuestring, "admin", 20) && 0 == strncmp(cjson_password->valuestring, "123456", 20))
        {
		cJSON_AddStringToObject(cjson_return, "code", "ready");
		cJSON_AddStringToObject(cjson_return, "token", "123456qwertyuiop");
                //printf("true");
        }
        else
        {
		cJSON_AddStringToObject(cjson_return, "code", "error");
                //printf("false");
        }
	ret_str = cJSON_Print(cjson_return);
	printf("%s\n", ret_str);
	return 0;
}

int main()
{
	login();
	return 0;
}
