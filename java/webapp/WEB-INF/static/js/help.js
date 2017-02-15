var o = document.querySelector('.member-nav'),
    links = o.querySelectorAll('a');

for(var i=0,v;v=links[i++];){
    v.onclick=function(){
        this.obj = this.obj||document.querySelector(this.getAttribute('href'));

        document.documentElement.scrollTop = document.body.scrollTop = this.obj.offsetTop+30;
        return false;
    }
}