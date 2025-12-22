<?php

namespace App\Support;

use RuntimeException;

class Fernet
{
    private string $signKey; // 16 bytes
    private string $encKey;  // 16 bytes

    public function __construct(string $base64UrlKey)
    {
        $raw = $this->b64url_decode(trim($base64UrlKey));
        if (strlen($raw) !== 32) {
            throw new RuntimeException("APP_ENC_KEY non valida: attesi 32 bytes dopo base64url decode");
        }
        $this->signKey = substr($raw, 0, 16);
        $this->encKey  = substr($raw, 16, 16);
    }

    public function decrypt(string $token): string
    {
        $data = $this->b64url_decode(trim($token));

        if (strlen($data) < 1 + 8 + 16 + 32) {
            throw new RuntimeException("Token Fernet troppo corto");
        }

        $version = ord($data[0]);
        if ($version !== 0x80) {
            throw new RuntimeException("Versione Fernet non valida");
        }

        $hmac = substr($data, -32);
        $msg  = substr($data, 0, -32);

        $calc = hash_hmac('sha256', $msg, $this->signKey, true);
        if (!hash_equals($hmac, $calc)) {
            throw new RuntimeException("HMAC non valida");
        }

        $iv = substr($msg, 1 + 8, 16);
        $ct = substr($msg, 1 + 8 + 16);

        $pt = openssl_decrypt($ct, 'aes-128-cbc', $this->encKey, OPENSSL_RAW_DATA, $iv);
        if ($pt === false) {
            throw new RuntimeException("Decrypt fallita");
        }

        return $pt;
    }

    private function b64url_decode(string $s): string
    {
        $s = strtr($s, '-_', '+/');
        $pad = strlen($s) % 4;
        if ($pad) $s .= str_repeat('=', 4 - $pad);

        $out = base64_decode($s, true);
        if ($out === false) {
            throw new RuntimeException("Base64 decode fallita");
        }
        return $out;
    }
}
