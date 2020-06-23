import 'package:cognigy_flutter_client/models/message_model.dart';
import 'package:url_launcher/url_launcher.dart';


/// Gets Cognigy.AI message information.
/// 
/// This application uses the Webchat tab in the Say node to create template messages such as Gallery items or Images.
/// For plain text messages, use the Default tab in the Say node.
ChatMessage processCognigyMessage(dynamic cognigyResponse) {
  if (cognigyResponse['type'] == 'output') {
    // check for simple text
    if (cognigyResponse['data']['text'] != null) {
      return new ChatMessage('text', cognigyResponse['data']['text'], null);
    }

    // check for quick replies
    if (cognigyResponse['data']['data']['_cognigy']['_webchat']['message']
            ['quick_replies'] !=
        null) {
      String text = cognigyResponse['data']['data']['_cognigy']['_webchat']
          ['message']['text'];

      List quickReplies = cognigyResponse['data']['data']['_cognigy']
          ['_webchat']['message']['quick_replies'];

      return new ChatMessage('quick_replies', text, quickReplies);
    }

    // check for image
    if (cognigyResponse['data']['data']['_cognigy']['_webchat']['message']
            ['attachment']['type'] ==
        'image') {
      String url = cognigyResponse['data']['data']['_cognigy']['_webchat']
          ['message']['attachment']['payload']['url'];

      return new ChatMessage('image_attachment', url, null);
    }

    // check for gallery
    if (cognigyResponse['data']['data']['_cognigy']['_webchat']['message']
                ['attachment']['type'] ==
            'template' &&
        cognigyResponse['data']['data']['_cognigy']['_webchat']['message']
                ['attachment']['payload']['template_type'] ==
            'generic') {
      List galleryItems = cognigyResponse['data']['data']['_cognigy']
          ['_webchat']['message']['attachment']['payload']['elements'];

      return new ChatMessage('gallery', '', galleryItems);
    }

    if (cognigyResponse['data']['data']['_cognigy']['_webchat']['message']
            ['attachment']['type'] ==
        'video') {
      String url = cognigyResponse['data']['data']['_cognigy']['_webchat']
          ['message']['attachment']['payload']['url'];

      return new ChatMessage('video', url, null);
    }

    if (cognigyResponse['data']['data']['_cognigy']['_webchat']['message']
            ['attachment']['type'] ==
        'video') {}

    // check for buttons
    if (cognigyResponse['data']['data']['_cognigy']['_webchat']['message']
                ['attachment']['type'] ==
            'template' &&
        cognigyResponse['data']['data']['_cognigy']['_webchat']['message']
                ['attachment']['payload']['template_type'] ==
            'button') {
      String buttonText = cognigyResponse['data']['data']['_cognigy']
          ['_webchat']['message']['attachment']['payload']['text'];
      List buttons = cognigyResponse['data']['data']['_cognigy']['_webchat']
          ['message']['attachment']['payload']['buttons'];

      return new ChatMessage('buttons', buttonText, buttons);
    }

    // check for list
    if (cognigyResponse['data']['data']['_cognigy']['_webchat']['message']
                ['attachment']['type'] ==
            'template' &&
        cognigyResponse['data']['data']['_cognigy']['_webchat']['message']
                ['attachment']['payload']['template_type'] ==
            'list') {
      List listItems = cognigyResponse['data']['data']['_cognigy']['_webchat']
          ['message']['attachment']['payload']['elements'];
      List listButtons = cognigyResponse['data']['data']['_cognigy']['_webchat']
          ['message']['attachment']['payload']['buttons'];

      return new ChatMessage(
          'list', '', {'listItems': listItems, 'listButtons': listButtons});
    }
  }
}

// method to open a url
launchUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
