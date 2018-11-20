function Copy-TargetFile {
    Add-Type -AssemblyName System.Windows.Forms
    $fileToCopy = New-Object System.Windows.Forms.OpenFileDialog
    $fileToCopy.ShowDialog()
    
    $a=$fileToCopy.FileName

    Copy-Item  @params{
        Path = $a 
        ToSession = $session 
        Destination = 'C:\windows\temp\'$fileToCopy.SafeFileName
        }
        
}


function Open-CopySession {
    $targetComputer = Read-Host -Prompt 'What is the HOSTNAME of the target?' 

    # Create a session with $targetComputer
        $session = New-PSSession -ComputerName $targetComputer


}
Open-CopySession
Copy-TargetFile