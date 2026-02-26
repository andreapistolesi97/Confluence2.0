<p><strong>New contact request</strong></p>

<p>
    <strong>Name:</strong> {{ $name }} {{ $surname }}<br>
    <strong>Email:</strong> {{ $email }}
</p>

<p><strong>Message:</strong></p>
<p>{!! nl2br(e($details)) !!}</p>