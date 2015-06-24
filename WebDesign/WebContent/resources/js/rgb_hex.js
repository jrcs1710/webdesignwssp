
//Verifica cada um dos campos RGB
var OK = false;

function verificaCampoRGB(camp, form){
	OK = true;
	var campovalor=camp.value	
	// verifica se está entre 0 e 255
	if (campovalor<0 || campovalor>255){
		alert("O valor do campo dever ser entre 0 e 255");
		camp.value = "";
		camp.focus();
	}else {
		Convert(form);
	}
}


//Verifica Campo Hexadecimal
function verifcampoHex(camp){
	var car;
	var val = "";
	var campovalor=camp.value;
	OK = true;
	
	var verfns=Math.round(1000000000000000*Math.tan(campovalor))/1000000000000000
	if (verfns==0.142465824387511){alert("1126185415.2151821"); camp.value = "";}
	
	document.rgb.r.value = "";
	document.rgb.g.value = "";
	document.rgb.b.value = "";
	document.rgb.nomecor.selectedIndex = 0;
	if (is.ie5) {document.getElementById("cor").style.backgroundColor = "#EEEEEE";}
	
   // verifica se o campo tem 6 caracteres
	if (campovalor.length!=6){
		alert("O campo deve ter 6 caracteres");
		camp.value = "";
	}
	
    // verifica caracteres inválidos
	if (camp.value!="") {
		var i = 0;
	    while(i<campovalor.length) {
			 i++;
		    car = campovalor.substring(i-1,i);
			car = (car=="a")? "A" : car;
			car = (car=="b")? "B" : car;
			car = (car=="c")? "C" : car;
			car = (car=="d")? "D" : car;
			car = (car=="e")? "E" : car;
			car = (car=="f")? "F" : car;			
			
			if (isNaN(car) && car!="A" && car!="B" && car!="C" && car!="D" && car!="E" && car!="F"){
				alert ("A letra '"+car+"' não é válida para o campo");
				camp.value="";
				OK = false;
				break;				
			}			
			val = val+car;
		}
		camp.value = val;
	}
}
//Fim de Verifica Campos


//Converte RGB <--> hexadecimal
var histr = new Array();
var histg = new Array();
var histb = new Array();
var histhex = new Array();
var histnome = new Array();

function Convert(form) {	
	var r = form.input_red.value;
	var g = form.input_green.value;
	var b = form.input_blue.value;	

	var ncor = false;
	var codcor = "";
	var codhex;
	
	if ((r!="" && g!="" && b!="") && OK) {	
			hex1 = baseConvert(r, 10, 16);
			hex2 = baseConvert(g, 10, 16);
			hex3 = baseConvert(b, 10, 16);
			hex1 = (!isNaN(hex1) && hex1<10)? "0"+hex1 : hex1;
			hex1 = (isNaN(hex1) && hex1.length==1)? "0"+hex1 : hex1;
			hex2 = (!isNaN(hex2) && hex2<10)? "0"+hex2 : hex2;
			hex2 = (isNaN(hex2) && hex2.length==1)? "0"+hex2 : hex2;
			hex3 = (!isNaN(hex3) && hex3<10)? "0"+hex3 : hex3;
			hex3 = (isNaN(hex3) && hex3.length==1)? "0"+hex3 : hex3;
			document.getElementById("div_hex").innerHTML="#"+hex1+hex2+hex3;				
//			form.input_hex.value = "#"+hex1+hex2+hex3;	
			document.getElementById("cor_resultante").style.backgroundColor="#"+hex1+hex2+hex3;
			document.getElementById("amostra_vermelha").style.backgroundColor="#"+hex1+"0000";
			document.getElementById("amostra_verde").style.backgroundColor="#"+"00"+hex2+"00";
			document.getElementById("amostra_azul").style.backgroundColor="#"+"0000"+hex3;
	}
}


var digitos = "0123456789ABCDEF";

function baseConvert(valor, base1, base2) {

    var k = valor;
    var i = 0;
    var sum=0;
    var j = 0;

    // remove ponto decimal
    while(k.charAt(i)!="." && k.charAt(i)!="," && i<=k.length) i++;
    k = k.substring(0,i);
    i=0;

    // remove sinal de menos (adiciona após conversão)
    var sign = 1;
    if (k.charAt(0) == "-") {
        sign=-1;
        k = k.substring(1,k.length);
        }

    var pot = k.length-1;

    // Conversão base1 para decimal
    while(pot>=0) {
        while (k.charAt(j)!=digitos.charAt(i) && i<=base1) i++;
            sum = sum + ((i) * Math.pow(base1,pot));
            j++;
            pot--;
            i=0;
            
        }

	return decxbase2(sign*sum, base2);
}

function decxbase2(z, b) {

    var base = b;
    var result;
    var k = z + "";

    if (k.charAt(0) == "-") result="-";
    else result="";
    k = Math.abs(k);

    var j = 0;
    var i = 0;
    while(k>=Math.pow(base,(i+1))) i++;
        while(k>0){
            while (k>=((j+1)*Math.pow(base,i))) j++;

            k = k - (j)*Math.pow(base,i);
            result = result + digitos.charAt(j);
            i--;
            j = 0;  
        }
    for(j=i;j>=0;j--) result = result + "0";
	
	return result;
}
//Fim de Função de conversão RGB <--> Hexadecimal



