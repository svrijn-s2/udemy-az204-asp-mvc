Connect-AzAccount

$Location = "North Europe"
$ResourceGroupName = "web-grp"
$AppServicePlanName = "learningplan7000441894484894894898954654"

New-AzResourceGroup -Name $ResourceGroupName -Location $Location

New-AzAppServicePlan -ResourceGroupName $ResourceGroupName -Name $AppServicePlanName `
    -Location $Location -Tier Basic

$AppName = "leaningapp58878755654645464564654456"

New-AzWebApp -ResourceGroupName $ResourceGroupName -Location $Location -Name $AppName `
    -AppServicePlan $AppServicePlanName

$gitrepo = "https://github.com/svrijn-s2/udemy-az204-asp-mvc"

$PropertiesObject = @{
    repoUrl             = $gitrepo;
    branch              = "main";
    isManualIntegration = "true";
}

Set-AzResource -PropertyObject $PropertiesObject -ResourceGroupName $ResourceGroupName `
    -ResourceType Microsoft.Web/sites/sourcecontrols `
    -ResourceName $AppName/web -ApiVersion 2015-08-01 -Force