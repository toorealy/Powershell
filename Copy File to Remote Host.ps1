function Copy-TargetFile {
    Add-Type -AssemblyName System.Windows.Forms
    $fileToCopy = New-Object System.Windows.Forms.OpenFileDialog
    $fileToCopy.ShowDialog()
    
    $a=$fileToCopy.FileName
    # copy-item only works with one session at a time
    Copy-Item -Path $a -ToSession $session -Destination = 'C:\windows\temp\'$fileToCopy.SafeFileName        
}


function Open-CopySession {
    $ErrorActionPreference = "silentlycontinue"
    $targetComputer = Read-Host -Prompt 'What is the HOSTNAME of the target?' 

    # Create a session with $targetComputer
        $session = New-PSSession -ComputerName $targetComputer


}


if (Open-CopySession){
    Copy-TargetFile
    
}else{
    Write-Host 'The session failed to start'
}
