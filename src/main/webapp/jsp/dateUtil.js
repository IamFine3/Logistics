var dateUtil = function(){
	this.isLeapYear = function(date){
        return (0==date.getYear()%4&&((date.getYear()%100!=0)||(date.getYear()%400==0))); 
    }
	
	function dateToStr(formatStr, date){
        formatStr = arguments[0] || "yyyy-MM-dd HH:mm:ss";
        date = arguments[1] || new Date();
        var str = formatStr;   
        var Week = ['日','一','二','三','四','五','六'];  
        str=str.replace(/yyyy|YYYY/,date.getFullYear());   
        str=str.replace(/yy|YY/,(date.getYear() % 100)>9?(date.getYear() % 100).toString():'0' + (date.getYear() % 100));   
        str=str.replace(/MM/,date.getMonth()>9?(date.getMonth() + 1):'0' + (date.getMonth() + 1));   
        str=str.replace(/M/g,date.getMonth());   
        str=str.replace(/w|W/g,Week[date.getDay()]);   
      
        str=str.replace(/dd|DD/,date.getDate()>9?date.getDate().toString():'0' + date.getDate());   
        str=str.replace(/d|D/g,date.getDate());   
      
        str=str.replace(/hh|HH/,date.getHours()>9?date.getHours().toString():'0' + date.getHours());   
        str=str.replace(/h|H/g,date.getHours());   
        str=str.replace(/mm/,date.getMinutes()>9?date.getMinutes().toString():'0' + date.getMinutes());   
        str=str.replace(/m/g,date.getMinutes());   
      
        str=str.replace(/ss|SS/,date.getSeconds()>9?date.getSeconds().toString():'0' + date.getSeconds());   
        str=str.replace(/s|S/g,date.getSeconds());   
      
        return str;   
    }
	
	this.formatDate = function(date, fmt) {
		 var o = {  
			        "M+" : this.getMonth() + 1, // 月份  
			        "d+" : this.getDate(), // 日  
			        "H+" : this.getHours(), // 小时  
			        "m+" : this.getMinutes(), // 分  
			        "s+" : this.getSeconds(), // 秒  
			        "q+" : Math.floor((this.getMonth() + 3) / 3), // 季度  
			        "S" : this.getMilliseconds()  
			    // 毫秒  
			    };  
			    if (/(y+)/.test(fmt)) {  
			        fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "")  
			                .substr(4 - RegExp.$1.length));  
			    }  
			    for ( var k in o) {  
			        if (new RegExp("(" + k + ")").test(fmt)) {  
			            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k])  
			                    : (("00" + o[k]).substr(("" + o[k]).length)));  
			        }  
			    }  
			    return fmt;  
	  }
} 