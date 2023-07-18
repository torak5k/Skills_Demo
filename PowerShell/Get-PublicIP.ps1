<#
DISCLAIMER
==========
THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#>


$dataPull = Invoke-RestMethod -Uri "https://api.ipdata.co?api-key=test"

Write-Host ""
Write-Host "WARNING! This script will generate inaccurate information if you are currently connected to a VPN!"
Write-Host ""

Write-Host "Your public IP address is:" $dataPull.ip
Write-Host "Your city is:" $dataPull.city
Write-Host "Your state is:" $dataPull.region_code
Write-Host "Your ISP is:" $dataPull.asn.name

Write-Host ""
Write-Host ""