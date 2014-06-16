Ribot Challenge


Hello Ribots, this is my source code for the coding challenge.


Some notes:

Core Data was implemented but not used for persist the data from the API calls unfortunately.

Cache however was implemented on the NSURLSession.

Used UICollectionView to display Ribot members through their ribotar or a default image if one does not have a ribotar.

To get information async from the API i used NSURLSessionDataTask and to get ribotars i used NSURLSessionDownloadTask.

Intended to use a protocol to warn me about completion but stayed with blocks that better fit this task in my opinion.

The button email will open a MFMailComposeViewController with "Recipient" filled with member email.

The MKMapView shows the location provided by member using the address.

In the wireframes also shows "Last tweets" but i did not implemented that functionality (uses the Social Framework).
