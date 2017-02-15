function transformArrayNum(arrays){
	var total = 0;
	var number = [];
	$.each(arrays,function(i,p){
		total =total + arrays[i];
	});
	if(arrays.length > 0){
		for(var n=0;n<arrays.length;n++){
			number[n] = (arrays[n]*100/total).toFixed(2);
		}
	}
	return number;
}