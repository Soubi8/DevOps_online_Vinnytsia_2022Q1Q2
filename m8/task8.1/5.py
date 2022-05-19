# pip install emoji
from emoji import emojize


def text_to_emoji(users_text):
    words = users_text.split(" ")
    emojis = {
        "angry": emojize(":angry_face:"),
        "happy": emojize(":grinning_face:"),
        "sad": emojize(":pleading_face:"),
        "okay": emojize(":thumbs_up:"),
        "fine": emojize(":neutral_face:"),
        "lovely": emojize(":smiling_face_with_hearts:"),
        "exciting": emojize(":partying_face:"),
        "great": emojize(":grinning_face_with_smiling_eyes:")
    }
    output = " "
    for word in words:
        output += emojis.get(word, word) + " "
    return output


users_text = input("Please tell me, how are you today? ")
print(text_to_emoji(users_text))
