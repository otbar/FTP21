<cfset page.title ="Map Pointers">

<cfquery name="getinfo" dataSource="#application.dsn#">
  select * from cms_map order by title
</cfquery>

<cfinclude template="/admin/components/header.cfm">  

<cfif isdefined('url.success')>
  <div class="alert alert-success">
    <button class="close" data-dismiss="alert">?</button>
    <strong>Record deleted!</strong>
  </div>
</cfif>

<p>
  <a href="form.cfm" class="btn btn-success"><i class="icon-plus icon-white"></i> Add New</a>
  <a href="/admin/map_categories" class="btn btn-info"><i class="icon-pencil icon-white"></i> Edit Categories</a>
</p>

<cfif getinfo.recordcount gt 0>
<div class="widget-box">
  <div class="widget-content nopadding">
    <table class="table table-bordered table-striped">
    <tr>
      <th>No.</th>
      <th>Title</th>
      <th></th> 
      <th></th>  
    </tr>        
    <cfoutput query="getinfo">
      <tr>
        <td width="45">#currentrow#.</td>
        <td>#title#</td>
        <td width="50"><a href="form.cfm?id=#id#" class="btn btn-mini btn-primary"><i class="icon-pencil icon-white"></i> Edit</a></td>
        <td width="65"><a href="submit.cfm?id=#id#&delete" class="btn btn-mini btn-danger" data-confirm="Are you sure you want to delete this map pointer?"><i class="icon-remove icon-white"></i> Delete</a></td>         
      </tr>
    </cfoutput>
    </table>
  </div>
</div>
</cfif>

<cfinclude template="/admin/components/footer.cfm">