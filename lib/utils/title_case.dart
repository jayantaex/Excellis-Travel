String toTitleCase(String text) => text
    .toLowerCase()
    .split(' ')
    .map((word) =>
        word.isNotEmpty ? word[0].toUpperCase() + word.substring(1) : '')
    .join(' ');
