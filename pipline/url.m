function [response, message] = url(str_url)
  [s, response, msg] = urlread(str_url);
  if(response == 1) 
    message = loadjson(s);
  else
    message = msg;
  end
end