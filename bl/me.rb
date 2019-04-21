post '/me/toggle_active' do
	halt unless cu
	active = cu['active']
	$users.update_id(cuid,{active: !active})
	{active: !active}
end