<cfset page.title = "Reunions & Retreats">

<cfquery name="getinfo" dataSource="#application.dsn#">
  SELECT * FROM cms_reunions_retreats_locations ORDER BY name
</cfquery>


<cfinclude template="/admin/components/header.cfm">

<cfif isdefined('url.success')>
  <div class="alert alert-success">
    <button class="close" data-dismiss="alert">&times;</button>
    <strong>Record deleted!</strong>
  </div>
<cfelseif isdefined('url.successarea')>
	<div class="alert alert-success">
    	<button class="close" data-dismiss="alert">&times;</button>
    	<strong>Area added successfully!</strong>
  	</div>
</cfif>

<p>
<a href="addarea.cfm" class="btn btn-success"><i class="icon-plus icon-white"></i> Add New</a></p>

<cfif getinfo.recordcount gt 0>
<div class="widget-box">
  <div class="widget-content nopadding">
    <table class="table table-bordered table-striped">
    <tr>
      <th>No.</th>
	  <th>Area</th>
	  <th></th>
      <th></th>

    </tr>
    <cfoutput query="getinfo">
      <tr>
        <td width="45">#currentrow#.</td>
		<td>#name#</td>
        <td width="50"><a href="form.cfm?id=#id#" class="btn btn-mini btn-primary"><i class="icon-pencil icon-white"></i> Edit</a></td>
        <td width="65"><a href="submit.cfm?id=#id#&delete" class="btn btn-mini btn-danger" data-confirm="Are you sure you want to delete this event?"><i class="icon-remove icon-white"></i> Delete</a></td>
      </tr>
    </cfoutput>
    </table>
  </div>
</div>
</cfif>

<cfinclude template="/admin/components/footer.cfm">
