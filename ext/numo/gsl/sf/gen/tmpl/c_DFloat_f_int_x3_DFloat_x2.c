static void
iter_<%=c_func%>(na_loop_t *const lp)
{
    int    c0, c1, c2;
    double c3, c4, *c6;
    <%=struct%> *w;
    void **opt = (void**)(lp->opt_ptr);

    w  = (<%=struct%>*)(opt[0]);
    c0 = *(int*)(opt[1]); //<%=args[0][1]%>
    c1 = *(int*)(opt[2]); //<%=args[1][1]%>
    c2 = *(int*)(opt[3]); //<%=args[2][1]%>
    c3 = *(double*)GET_PTR(lp,0); //<%=args[3][1]%>
    c4 = *(double*)GET_PTR(lp,1); //<%=args[4][1]%>
    c6 =  (double*)GET_PTR(lp,2); //<%=args[6][1]%>
    <%=func_name%>(c0,c1,c2,c3,c4,w,c6);
}

/*
  @overload <%=name%>(<%=args[0][1]%>,<%=args[1][1]%>,<%=args[2][1]%>,<%=args[3][1]%>)

  @param [Integer]  <%=args[0][1]%>
  @param [Integer]  <%=args[1][1]%>
  @param [Numo::DFloat]  <%=args[2][1]%>
  @param [Numo::DFloat]  <%=args[3][1]%>
  @return [Numo::DFloat]  returns <%=args[5][1]%>

  <%= description %>
*/
static VALUE
<%=c_func(5)%>(VALUE self, VALUE v0, VALUE v1, VALUE v2, VALUE v3, VALUE v4)
{
    <%=struct%> *w;
    int j, nmin, nmax;
    size_t shape[1];
    ndfunc_arg_in_t ain[2] = {{cDF,0},{cDF,0}};
    ndfunc_arg_out_t aout[1] = {{cDF,1,shape}};
    ndfunc_t ndf = {iter_<%=c_func%>,NO_LOOP|NDF_INPLACE|NDF_EXTRACT,2,1,ain,aout};
    void *opt[4];

    TypedData_Get_Struct(self, <%=struct%>, &<%=data_type_var%>, w);

    j    = NUM2INT(v0);
    nmin = NUM2INT(v1);
    nmax = NUM2INT(v2);
    opt[0] = w;
    opt[1] = &j; //j
    opt[2] = &nmin;
    opt[3] = &nmax;
    if (nmin<0 || nmax<0 || nmin>nmax) {
        rb_raise(rb_eArgError,"should be nmin>=0 && nmax>=0 && nmin<=nmax");
    }
    shape[0] = nmax-nmin+1;
    return na_ndloop3(&ndf,opt,2,v3,v4);
}
